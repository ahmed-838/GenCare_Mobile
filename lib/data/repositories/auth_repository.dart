import 'package:gencare/domain/repositories/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<void> login(String email, String password) async {
    // تنفيذ عملية تسجيل الدخول
    await Future.delayed(const Duration(seconds: 1));
  }
} 