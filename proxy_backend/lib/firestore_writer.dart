import 'dart:convert';
import 'package:http/http.dart' as http;

/// Writes vehicle telemetry data to Firestore via the REST API.
///
/// Firestore document path: `telemetry/{vin}`
///
/// This is used by the Fleet Telemetry WebSocket handler to persist incoming
/// Tesla push data so that the Flutter app (subscribing to Firestore streams)
/// receives real-time updates without polling.
class FirestoreWriter {
  final String projectId;
  final String apiKey;

  static const String _baseUrl = 'https://firestore.googleapis.com/v1';
  static const String _authUrl = 'https://identitytoolkit.googleapis.com/v1';

  String? _idToken;
  DateTime? _tokenExpiry;

  FirestoreWriter({required this.projectId, required this.apiKey});

  /// Obtains (or reuses) a Firebase anonymous auth ID token.
  /// The token is valid for 1 hour; we refresh 5 minutes before expiry.
  Future<String?> _getIdToken() async {
    final now = DateTime.now();
    if (_idToken != null && _tokenExpiry != null &&
        _tokenExpiry!.isAfter(now.add(const Duration(minutes: 5)))) {
      return _idToken;
    }

    try {
      final response = await http.post(
        Uri.parse('$_authUrl/accounts:signUp?key=$apiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'returnSecureToken': true}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        _idToken = data['idToken'] as String?;
        final expiresIn = int.tryParse(data['expiresIn']?.toString() ?? '3600') ?? 3600;
        _tokenExpiry = now.add(Duration(seconds: expiresIn));
        return _idToken;
      } else {
        print('FirestoreWriter: auth failed ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      print('FirestoreWriter: auth error: $e');
    }
    return null;
  }

  /// Writes [fields] as a Firestore document at `telemetry/{vin}` using PATCH
  /// (merge semantics — only the supplied keys are updated).
  Future<void> writeTelemetry(String vin, Map<String, dynamic> fields) async {
    final token = await _getIdToken();

    final maskParams = fields.keys.map((k) => 'updateMask.fieldPaths=$k').join('&');
    final url = Uri.parse(
      '$_baseUrl/projects/$projectId/databases/(default)/documents/telemetry/$vin'
      '?key=$apiKey&$maskParams',
    );

    final headers = <String, String>{'Content-Type': 'application/json'};
    if (token != null) headers['Authorization'] = 'Bearer $token';

    final body = jsonEncode({'fields': _toFirestoreFields(fields)});

    try {
      final response = await http.patch(url, headers: headers, body: body);

      if (response.statusCode >= 400) {
        print('FirestoreWriter: PATCH failed ${response.statusCode}: ${response.body}');
        // Token may have been revoked — clear it so it's refreshed next call
        if (response.statusCode == 401 || response.statusCode == 403) {
          _idToken = null;
          _tokenExpiry = null;
        }
      }
    } catch (e) {
      print('FirestoreWriter: HTTP error: $e');
    }
  }

  /// Converts a plain Dart map into Firestore's typed field value format.
  Map<String, dynamic> _toFirestoreFields(Map<String, dynamic> map) {
    return map.map((key, value) => MapEntry(key, _toFirestoreValue(value)));
  }

  dynamic _toFirestoreValue(dynamic value) {
    if (value == null) return {'nullValue': null};
    if (value is bool) return {'booleanValue': value};
    if (value is int) return {'integerValue': value.toString()};
    if (value is double) return {'doubleValue': value};
    if (value is String) return {'stringValue': value};
    if (value is Map<String, dynamic>) {
      return {'mapValue': {'fields': _toFirestoreFields(value)}};
    }
    if (value is List) {
      return {
        'arrayValue': {
          'values': value.map(_toFirestoreValue).toList(),
        }
      };
    }
    return {'stringValue': value.toString()};
  }
}
