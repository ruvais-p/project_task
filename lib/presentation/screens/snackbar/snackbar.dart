import 'package:flutter/material.dart';
import 'package:task_project/presentation/themes/app_colors.dart';
import 'package:task_project/presentation/themes/app_fonts.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void showErrorSnackBar(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(message, style: AppFonts.baseStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 18, color: AppColors.secondaryColor),),
      backgroundColor: AppColors.gradiantColor,
    
    ),
  );
}
