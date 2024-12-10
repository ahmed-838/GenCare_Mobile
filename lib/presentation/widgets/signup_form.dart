import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import 'custom_button.dart';

class SignupForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;
  final TextEditingController phoneController;
  final bool isLoading;
  final VoidCallback onSubmit;

  const SignupForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
    required this.phoneController,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: usernameController,
            label: 'اسم المستخدم',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال اسم المستخدم';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: emailController,
            label: 'البريد الإلكتروني',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال البريد الإلكتروني';
              }
              if (!value.contains('@')) {
                return 'بريد إلكتروني غير صالح';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: phoneController,
            label: 'رقم الهاتف',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال رقم الهاتف';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: passwordController,
            label: 'كلمة المرور',
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال كلمة المرور';
              }
              if (value.length < 6) {
                return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomButton(
            onPressed: onSubmit,
            text: 'إنشاء حساب',
            isLoading: isLoading,
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'لديك حساب بالفعل؟ تسجيل الدخول',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
} 