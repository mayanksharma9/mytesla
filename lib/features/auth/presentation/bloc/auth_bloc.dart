import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/auth_repository.dart';
import '../../domain/security_repository.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:firebase_auth/firebase_auth.dart';

// States
enum AuthStatus { initial, authenticated, unauthenticated, loading, error }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? error;
  final bool isVirtualKeyRegistered;
 
  final UserProfile? userProfile;
 
  const AuthState({
    this.status = AuthStatus.initial,
    this.error,
    this.isVirtualKeyRegistered = false,
    this.userProfile,
  });
 
  @override
  List<Object?> get props => [status, error, isVirtualKeyRegistered, userProfile];

  AuthState copyWith({
    AuthStatus? status,
    String? error,
    bool? isVirtualKeyRegistered,
    UserProfile? userProfile,
  }) {
    return AuthState(
      status: status ?? this.status,
      error: error ?? this.error,
      isVirtualKeyRegistered: isVirtualKeyRegistered ?? this.isVirtualKeyRegistered,
      userProfile: userProfile ?? this.userProfile,
    );
  }
}

// Events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class LoginRequested extends AuthEvent {}

class LogoutRequested extends AuthEvent {}

class ProfileFetched extends AuthEvent {
  final UserProfile profile;
  const ProfileFetched(this.profile);

  @override
  List<Object?> get props => [profile];
}

class ToggleVirtualKeyStatus extends AuthEvent {
  final bool isRegistered;
  const ToggleVirtualKeyStatus(this.isRegistered);

  @override
  List<Object?> get props => [isRegistered];
}

// Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final SecurityRepository _securityRepository;

  AuthBloc(this._authRepository, this._securityRepository) : super(const AuthState()) {
    on<AppStarted>(_onAppStarted);
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<ProfileFetched>(_onProfileFetched);
    on<ToggleVirtualKeyStatus>(_onToggleVirtualKeyStatus);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    debugPrint('AuthBloc: AppStarted event received');
    emit(state.copyWith(status: AuthStatus.loading));
    
    final isKeyRegistered = await _securityRepository.isKeyAsRegistered();
    
    emit(state.copyWith(
      isVirtualKeyRegistered: isKeyRegistered,
    ));

    // Check Firebase Auth status
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      debugPrint('AuthBloc: User is authenticated with Firebase');
      emit(state.copyWith(status: AuthStatus.authenticated));
      
      try {
        final profile = await _authRepository.getUserProfile();
        add(ProfileFetched(profile));
      } catch (e) {
        debugPrint('AuthBloc: Failed to fetch profile on start: $e');
      }
    } else {
      debugPrint('AuthBloc: No user found in Firebase');
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    }
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    debugPrint('AuthBloc: LoginRequested event received');
    emit(state.copyWith(status: AuthStatus.loading, error: null));
    try {
      final success = await _authRepository.login();
      if (success) {
        debugPrint('AuthBloc: Login succeeded');
        
        // --- SILENT KEY GENERATION ---
        final hasKey = await _securityRepository.hasKeyPair();
        if (!hasKey) {
          debugPrint('AuthBloc: Generating device key pair silently...');
          await _securityRepository.generateKeyPair();
        }

        emit(state.copyWith(status: AuthStatus.authenticated));
        
        try {
          final profile = await _authRepository.getUserProfile();
          add(ProfileFetched(profile));
        } catch (e) {
          debugPrint('AuthBloc: Failed to fetch profile: $e');
        }
      } else {
        debugPrint('AuthBloc: Login failed');
        emit(state.copyWith(status: AuthStatus.error, error: 'Login failed'));
      }
    } catch (e) {
      debugPrint('AuthBloc: Login error: $e');
      final message = e.toString().replaceFirst('Exception: ', '');
      emit(state.copyWith(status: AuthStatus.error, error: message));
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    await _authRepository.logout();
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }


  void _onProfileFetched(ProfileFetched event, Emitter<AuthState> emit) {
    emit(state.copyWith(userProfile: event.profile));
  }

  Future<void> _onToggleVirtualKeyStatus(ToggleVirtualKeyStatus event, Emitter<AuthState> emit) async {
    if (event.isRegistered) {
      await _securityRepository.markKeyAsRegistered();
    }
    emit(state.copyWith(isVirtualKeyRegistered: event.isRegistered));
  }
}
