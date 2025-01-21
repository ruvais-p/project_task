import 'package:flutter/material.dart';
import 'package:task_project/presentation/themes/app_colors.dart';
import 'package:task_project/presentation/themes/theme_custom_propertys.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    appBarTheme: ThemeCustomPropertys.appBarTheme(),
    textButtonTheme: ThemeCustomPropertys.textButtonThemeData(),
    textSelectionTheme: ThemeCustomPropertys.textSelectionThemeData(),
    inputDecorationTheme: ThemeCustomPropertys.inputDecorationTheme(),
    scaffoldBackgroundColor: AppColors.primaryColor,
  );
}