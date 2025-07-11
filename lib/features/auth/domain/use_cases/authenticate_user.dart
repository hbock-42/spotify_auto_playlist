import 'package:fpdart/fpdart.dart';
import '../entities/auth_tokens.dart';
import '../failures/auth_failure.dart';
import '../repositories/auth_repository.dart';

class AuthenticateUser {
  final AuthRepository _repository;

  AuthenticateUser(this._repository);

  Future<Either<AuthFailure, AuthTokens>> call() {
    return _repository.authenticate();
  }
}