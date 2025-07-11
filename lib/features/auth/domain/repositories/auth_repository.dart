import 'package:fpdart/fpdart.dart';
import '../entities/auth_tokens.dart';
import '../failures/auth_failure.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, AuthTokens>> authenticate();
  Future<Either<AuthFailure, AuthTokens>> refreshTokens(String refreshToken);
  Future<Either<AuthFailure, AuthTokens?>> getStoredTokens();
  Future<Either<AuthFailure, AuthTokens>> getCurrentTokens();
  Future<Either<AuthFailure, Unit>> clearTokens();
  Future<Either<AuthFailure, Unit>> storeTokens(AuthTokens tokens);
}