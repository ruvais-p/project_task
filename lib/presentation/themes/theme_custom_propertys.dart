import 'package:flutter/material.dart';
import 'package:task_project/presentation/themes/app_colors.dart';

class ThemeCustomPropertys {
  static AppBarTheme appBarTheme() =>
      AppBarTheme(backgroundColor: AppColors.primaryColor);

  static TextButtonThemeData textButtonThemeData() {
    return TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(AppColors.secondaryColor)));
  }

  static TextSelectionThemeData textSelectionThemeData() =>
      TextSelectionThemeData(cursorColor: AppColors.tertiaryColor);

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
        filled: true,
        hintStyle: TextStyle(color: AppColors.textGray),
        labelStyle: TextStyle(color: AppColors.textGray),
        fillColor: AppColors.primaryColor,
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        border: outlineInputBorder());
  }

  static OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grayColor),
        borderRadius: BorderRadius.circular(16));
  }
}
