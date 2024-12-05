import 'package:finwise_application/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finwise_application/core/constants/app_constants.dart';
import 'package:finwise_application/core/utils/validators.dart';
import 'package:finwise_application/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:finwise_application/config/routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authRepository = AuthRepositoryImpl();
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        User? user = await _authRepository.signInWithEmailPassword(
            _emailController.text, _passwordController.text);
        if (user != null) {
          if (mounted) {
            Navigator.pushReplacementNamed(context, '/entryPage');
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    fillColor: AppColors.lightGreen,
                  ),
                  validator: validateEmail,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    fillColor: AppColors.lightGreen,
                  ),
                  obscureText: true,
                  validator: validatePassword,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainGreen,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: AppColors.buttonTextColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signUpPage');
                },
                child: const Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
