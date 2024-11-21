// lib/main.dart
import 'package:finwise_application/features/pages/auth_pages/login_sign_page.dart';
import 'package:finwise_application/features/pages/splash_page/splash_screen.dart';
import 'package:finwise_application/features/pages/unknownpages/error_page.dart';
import 'package:flutter/material.dart';
import 'package:finwise_application/core/themes/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinWise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainGreen,
          primary: AppColors.mainGreen,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/LoginSignUpPage': (context) => const LoginSignUpPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/someDynamicRoute') {
          return MaterialPageRoute(
            builder: (context) => const ErrorPage(),
          );
        }
        return null; // Return null to let onUnknownRoute handle it if needed
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(), // Optional error handling
        );
      },
    );
  }
}
