import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/auth_repository.dart';
import '../../domain/security_repository.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';

// States
enum AuthStatus { initial, authenticated, unauthenticated, loading, error }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? error;
  final bool isDeveloperConfigured;
  final bool isVirtualKeyRegistered;
 
  final UserProfile? userProfile;
 
  const AuthState({
    this.status = AuthStatus.initial,
    this.error,
    this.isDeveloperConfigured = false,
    this.isVirtualKeyRegistered = false,
    this.userProfile,
  });
 
  @override
  List<Object?> get props => [status, error, isDeveloperConfigured, isVirtualKeyRegistered, userProfile];

  AuthState copyWith({
    AuthStatus? status,
    String? error,
    bool? isDeveloperConfigured,
    bool? isVirtualKeyRegistered,
    UserProfile? userProfile,
  }) {
    return AuthState(
      status: status ?? this.status,
      error: error ?? this.error,
      isDeveloperConfigured: isDeveloperConfigured ?? this.isDeveloperConfigured,
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
 
class CheckDeveloperCredentials extends AuthEvent {}
 
class SaveDeveloperCredentials extends AuthEvent {
  final String clientId;
  final String clientSecret;
  final String region;
 
  const SaveDeveloperCredentials({
    required this.clientId,
    required this.clientSecret,
    required this.region,
  });
 
  @override
  List<Object?> get props => [clientId, clientSecret, region];
}

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
    on<CheckDeveloperCredentials>(_onCheckDeveloperCredentials);
    on<SaveDeveloperCredentials>(_onSaveDeveloperCredentials);
    on<ProfileFetched>(_onProfileFetched);
    on<ToggleVirtualKeyStatus>(_onToggleVirtualKeyStatus);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    print('AuthBloc: AppStarted event received');
    emit(state.copyWith(status: AuthStatus.loading));
    
    final isConfigured = await _authRepository.hasDeveloperCredentials();
    final isKeyRegistered = await _securityRepository.isKeyAsRegistered();
    
    emit(state.copyWith(
      isDeveloperConfigured: isConfigured,
      isVirtualKeyRegistered: isKeyRegistered,
    ));

    final token = await _authRepository.getAccessToken();
    if (token != null) {
      print('AuthBloc: Token found, refreshing...');
      final refreshed = await _authRepository.refreshToken();
      if (refreshed) {
        print('AuthBloc: Token refresh successful');
        emit(state.copyWith(status: AuthStatus.authenticated));
        
        try {
          final profile = await _authRepository.getUserProfile();
          add(ProfileFetched(profile));
        } catch (e) {
          print('AuthBloc: Failed to fetch profile on start: $e');
        }
      } else {
        print('AuthBloc: Token refresh failed, clearing session');
        await _authRepository.logout();
        emit(state.copyWith(status: AuthStatus.unauthenticated));
      }
    } else {
      print('AuthBloc: No token found');
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    }
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    print('AuthBloc: LoginRequested event received');
    emit(state.copyWith(status: AuthStatus.loading, error: null));
    try {
      final success = await _authRepository.login();
      if (success) {
        print('AuthBloc: Login succeeded');
        
        // --- SILENT KEY GENERATION ---
        final hasKey = await _securityRepository.hasKeyPair();
        if (!hasKey) {
          print('AuthBloc: Generating device key pair silently...');
          await _securityRepository.generateKeyPair();
        }

        emit(state.copyWith(status: AuthStatus.authenticated));
        
        try {
          final profile = await _authRepository.getUserProfile();
          add(ProfileFetched(profile));
        } catch (e) {
          print('AuthBloc: Failed to fetch profile: $e');
        }
      } else {
        print('AuthBloc: Login failed');
        emit(state.copyWith(status: AuthStatus.error, error: 'Login failed'));
      }
    } catch (e) {
      print('AuthBloc: Login error: $e');
      final message = e.toString().replaceFirst('Exception: ', '');
      emit(state.copyWith(status: AuthStatus.error, error: message));
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    await _authRepository.logout();
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  Future<void> _onCheckDeveloperCredentials(
    CheckDeveloperCredentials event,
    Emitter<AuthState> emit,
  ) async {
    final isConfigured = await _authRepository.hasDeveloperCredentials();
    emit(state.copyWith(isDeveloperConfigured: isConfigured));
  }

  Future<void> _onSaveDeveloperCredentials(
    SaveDeveloperCredentials event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    await _authRepository.saveDeveloperCredentials(event.clientId, event.clientSecret, event.region);
    emit(state.copyWith(
      status: AuthStatus.initial,
      isDeveloperConfigured: true,
    ));
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
