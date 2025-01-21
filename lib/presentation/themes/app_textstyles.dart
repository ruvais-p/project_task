import 'package:flutter/material.dart';
import 'package:task_project/presentation/themes/app_colors.dart';
import 'package:task_project/presentation/themes/app_fonts.dart';

class AppTextstyles {
  static TextStyle subTitleTextStyle = AppFonts.baseStyle.copyWith(
    color: AppColors.textBlack,
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );

  static TextStyle moreOptionsTextStyle = AppFonts.baseStyle.copyWith(
    color: AppColors.gradiantColor,
    fontSize: 14,
    fontWeight: FontWeight.w800,
  );

  static TextStyle tileBodyTextStyle = AppFonts.baseStyle.copyWith(
    color: AppColors.secondaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static TextStyle authorTextStyle = AppFonts.baseStyle.copyWith(
    color: AppColors.secondaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
