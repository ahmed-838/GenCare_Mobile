import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gencare/domain/usecases/auth_usecase.dart';

// تعريف الحالات
abstract class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

// تعريف الأحداث
abstract class AuthEvent {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;
  
  AuthBloc(this.authUseCase) : super(AuthInitial());
} 