import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import '../domain/auth_repository.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:voltride/core/network/tesla_config.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthRepositoryImpl implements AuthRepository {
  final FirebaseFunctions _functions;
  final FirebaseAuth _auth;

  AuthRepositoryImpl(this._functions, this._auth);

  @override
  Future<bool> login() async {
    try {
      final clientId = TeslaConfig.clientId;
      final callbackUrl = TeslaConfig.callbackUrl;
      final callbackScheme = TeslaConfig.callbackScheme;

      final authUri = Uri.parse(TeslaConfig.authUrl).replace(
        queryParameters: {
          'client_id': clientId,
          'redirect_uri': callbackUrl,
          'response_type': 'code',
          'scope': TeslaConfig.scopeString,
          'state': 'vtr-${DateTime.now().millisecondsSinceEpoch}',
        },
      );

      final result = await FlutterWebAuth2.authenticate(
        url: authUri.toString(),
        callbackUrlScheme: callbackScheme,
      );

      final uri = Uri.parse(result);
      final code = uri.queryParameters['code'];
      
      if (code == null) return false;

      // Exchange code via Cloud Function
      final exchangeResult = await _functions.httpsCallable('exchangeTeslaCode').call({'code': code});
      
      if (exchangeResult.data['success'] == true) {
        debugPrint('AuthRepository: Token exchange successful via Cloud Function');
        
        // If the backend returns a Firebase custom token, sign in with it
        final firebaseToken = exchangeResult.data['firebaseToken'] as String?;
        if (firebaseToken != null) {
          debugPrint('AuthRepository: Signing in to Firebase with custom token...');
          await _auth.signInWithCustomToken(firebaseToken);
        }
        
        return true;
      } else {
        throw Exception('Token exchange failed: ${exchangeResult.data['error']}');
      }
    } catch (e) {
      debugPrint('AuthRepository: Login error: $e');
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    // Note: We don't delete tokens from Firestore here as they might be needed for background tasks,
    // but we sign out of Firebase.
    await _auth.signOut();
  }

  @override
  Future<bool> refreshToken() async {
    // In Thin Client mode, the Cloud Function handles refresh automatically.
    // We just need to check if we are still authenticated with Firebase.
    return _auth.currentUser != null;
  }

  @override
  Future<String?> getAccessToken() async {
    // Repositories should not access tokens directly in Thin Client mode.
    // They should call Cloud Functions which retrieve tokens from Firestore.
    return null; 
  }

  @override
  Future<UserProfile> getUserProfile() async {
    try {
      final result = await _functions.httpsCallable('getTeslaData').call({'path': '/api/1/users/me'});
      final data = result.data as Map;
      final response = data['response'];
      return UserProfile.fromJson(Map<String, dynamic>.from(response as Map));
    } catch (e) {
      debugPrint('AuthRepository: Failed to fetch profile: $e');
      rethrow;
    }
  }
}
