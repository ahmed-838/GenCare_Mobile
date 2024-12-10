import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import '../../core/validators/input_validators.dart';
import 'custom_button.dart';
import '../pages/signup_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_bloc.dart';
import '../pages/main_page.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final VoidCallback onSubmit;

  const LoginForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainPage()),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: emailController,
                  label: 'البريد الإلكتروني',
                  validator: InputValidators.email,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  label: 'كلمة المرور',
                  isPassword: true,
                  validator: InputValidators.password,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  onPressed: onSubmit,
                  text: 'تسجيل الدخول',
                  isLoading: isLoading,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SignupPage()),
                    );
                  },
                  child: const Text(
                    'ليس لديك حساب؟ إنشاء حساب جديد',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
} 