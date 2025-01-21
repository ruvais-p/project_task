
import 'package:flutter/material.dart';
import 'package:task_project/presentation/themes/app_colors.dart';
import 'package:task_project/presentation/themes/app_fonts.dart';
import 'package:task_project/presentation/themes/app_icon.dart';
import 'package:task_project/presentation/themes/app_padding.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({
    super.key,
    required this.userName,
    required this.gotoCart,
  });

  @override
  final String userName;
  final VoidCallback gotoCart;
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppIcon(
                    height: 20,
                    width: 20,
                    iconPath: "assets/icons/Sun.png",
                    iconColor: Color.fromRGBO(77, 129, 148, 1),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Good Morning",
                    style: AppFonts.baseStyle.copyWith(
                        color: AppColors.textBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              GestureDetector(
                onTap: gotoCart,
                child: AppIcon(
                    height: 24,
                    width: 24,
                    iconPath: "assets/icons/Buy.png",
                    iconColor: AppColors.blackColor),
              )
            ],
          ),
          Text(userName,
              style: AppFonts.baseStyle.copyWith(
                  color: AppColors.textBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}