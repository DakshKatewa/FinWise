// lib/core/constants/app_constants.dart
class AppConstants {
  AppConstants._(); // this thing here is a private constructor
  //ensuring that only one instance of the class exists throughout the application. This is useful for managing global state, such as theme colors.
  // Screen dimensions
  static const double screenWidth = 430.0;
  static const double screenHeight = 932.0;
  static const double borderRadius = 40.0;
  static const String emailError = "Please enter a valid email";
  static const String passwordError = "Password must be at least 6 characters";
}
