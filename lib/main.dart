// lib/main.dart
import 'package:finwise_application/config/routes/app_routes.dart';
import 'package:finwise_application/core/themes/app_themes.dart';
import 'package:finwise_application/features/auth/presentation/pages/auth_pages/pre_login.dart';
import 'package:finwise_application/features/splash/presentation/pages/splash_screen.dart';
import 'package:finwise_application/features/auth/presentation/pages/unknownpages/error_page.dart';
import 'package:finwise_application/features/bottom_navigation/add/presentation/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:finwise_application/core/themes/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => TransactionProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinWise',
      theme: appTheme,
      initialRoute: '/',
      routes: AppRoutes.getRoutes(),
      // onGenerateRoute: (settings) {
      //   return null; // Return null to let onUnknownRoute handle it if needed
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (context) => const ErrorPage(), // Optional error handling
      //   );
      // },
    );
  }
}
