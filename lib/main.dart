import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gencare/presentation/pages/login_page.dart';
import 'package:gencare/presentation/pages/main_page.dart';
import 'package:gencare/presentation/blocs/auth/auth_bloc.dart';
import 'package:gencare/di/injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // تهيئة ال dependencies
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => di.sl<AuthBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'GenCare',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: child!,
            ),
          );
        },
        routes: {
          '/': (context) => const LoginPage(),
          '/home': (context) => const MainPage(),
        },
      ),
    );
  }
}
