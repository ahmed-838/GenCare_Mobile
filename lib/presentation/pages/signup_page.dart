import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/signup_form.dart';
import '../blocs/auth/auth_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('إنشاء حساب', style: TextStyle(color: Colors.white)),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Card(
                color: Colors.grey[900],
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SignupForm(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    usernameController: _usernameController,
                    phoneController: _phoneController,
                    isLoading: state is AuthLoading,
                    onSubmit: () => _handleSubmit(context),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // سيتم إضافة منطق التسجيل لاحقاً
    }
  }
} 