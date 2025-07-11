import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../domain/use_cases/authenticate_user.dart';
import '../states/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticateUser _authenticateUser;
  final AuthRepository _authRepository;

  AuthNotifier({
    required AuthenticateUser authenticateUser,
    required AuthRepository authRepository,
  })  : _authenticateUser = authenticateUser,
        _authRepository = authRepository,
        super(const AuthState.initial()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final result = await _authRepository.getStoredTokens();
    
    result.fold(
      (failure) => state = const AuthState.unauthenticated(),
      (tokens) {
        if (tokens == null) {
          state = const AuthState.unauthenticated();
        } else if (tokens.isExpired) {
          if (tokens.canRefresh) {
            _refreshTokens(tokens.refreshToken!);
          } else {
            state = const AuthState.unauthenticated();
          }
        } else {
          state = AuthState.authenticated(tokens);
        }
      },
    );
  }

  Future<void> signIn() async {
    state = const AuthState.loading();
    
    final result = await _authenticateUser();
    
    state = result.fold(
      (failure) => AuthState.error(failure),
      (tokens) => AuthState.authenticated(tokens),
    );
  }

  Future<void> signOut() async {
    state = const AuthState.loading();
    
    final result = await _authRepository.clearTokens();
    
    state = result.fold(
      (failure) => AuthState.error(failure),
      (_) => const AuthState.unauthenticated(),
    );
  }

  Future<void> _refreshTokens(String refreshToken) async {
    final result = await _authRepository.refreshTokens(refreshToken);
    
    state = result.fold(
      (failure) {
        // If refresh fails, user needs to re-authenticate
        return const AuthState.unauthenticated();
      },
      (tokens) => AuthState.authenticated(tokens),
    );
  }
}