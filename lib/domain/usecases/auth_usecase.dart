import 'package:gencare/domain/repositories/i_auth_repository.dart';

class AuthUseCase {
  final IAuthRepository repository;

  AuthUseCase(this.repository);

  Future<void> login(String email, String password) {
    return repository.login(email, password);
  }
} 