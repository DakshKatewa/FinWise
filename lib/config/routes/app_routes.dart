import 'package:finwise_application/features/auth/presentation/pages/auth_pages/login_page.dart';
import 'package:finwise_application/features/auth/presentation/pages/auth_pages/pre_login.dart';
import 'package:finwise_application/features/auth/presentation/pages/auth_pages/signup_page.dart';
import 'package:finwise_application/features/entry/presentation/page/entry.dart';
import 'package:finwise_application/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const SplashScreen(),
      '/preLoginPage': (context) => const PreLoginPage(),
      '/loginPage': (context) => const LoginPage(),
      '/entryPage': (context) => const EntryPage(),
      '/signUpPage': (context) => const SignupPage()
    };
  }
}
