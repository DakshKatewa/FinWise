import 'package:flutter/material.dart';

class AppColors {
  /* 
    this is a private named constructor , 
    prevents creation of object of AppColors class
  */
  AppColors._();

  // static for data ,since it will remain consisten throughout the app

  //You can access it directly as AppColors.mainGreen anyhere in whole of the code without creating an object of the class.
  static const Color mainGreen = Color(0xFF00D09E);
  static const Color lightGreen = Color(0xFFD5F0C0);
  static const Color darkGreen = Color(0xFF052224);
  static const Color scaffoldColor = Color(0xFF093030);
  static const Color buttonTextColor = Color(0xFF093030);
}
