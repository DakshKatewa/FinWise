import 'package:finwise_application/features/bottom_navigation/add/presentation/pages/expense_add_page.dart';
import 'package:finwise_application/features/auth/presentation/pages/auth_pages/login_page.dart';
import 'package:finwise_application/features/auth/presentation/pages/auth_pages/pre_login.dart';
import 'package:finwise_application/features/auth/presentation/pages/auth_pages/signup_page.dart';
import 'package:finwise_application/features/bottom_navigation/charts/presentation/pages/chart_page.dart';
import 'package:finwise_application/features/bottom_navigation/entry/presentation/pages/entry.dart';
import 'package:finwise_application/features/bottom_navigation/reports/presentation/pages/report_page.dart';
import 'package:finwise_application/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const SplashScreen(),
      '/preLoginPage': (context) => const PreLoginPage(),
      '/loginPage': (context) => const LoginPage(),
      '/entryPage': (context) => const EntryPage(),
      '/signUpPage': (context) => const SignupPage(),
      '/records': (context) => const EntryPage(),
      '/charts': (context) => const ChartPage(),
      '/add': (context) => ExpenseAddPage(),
      '/reports': (context) => const ReportPage(),
    };
  }
}
