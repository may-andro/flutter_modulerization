import 'package:flutter/material.dart';

import 'colors/app_color.dart';

class AppTheme {
  static ThemeData lightThemeData = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: AppColor.white,
    brightness: Brightness.light,
    backgroundColor: AppColor.background,
    accentColor: AppColor.black,
    accentIconTheme: IconThemeData(color: AppColor.white),
    dividerColor: Colors.white54,
  );

  static ThemeData darkThemeData = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: AppColor.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: AppColor.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

}
