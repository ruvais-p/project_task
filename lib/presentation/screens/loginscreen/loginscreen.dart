import 'package:flutter/material.dart';
import 'package:task_project/common/globaltexts/globaltexts.dart';
import 'package:task_project/presentation/screens/mainscreen/mainscreen.dart';
import 'package:task_project/presentation/themes/app_colors.dart';
import 'package:task_project/presentation/themes/app_fonts.dart';
import 'package:task_project/presentation/themes/app_padding.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gradiantColor,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    scale: 1.0,
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/Group 10.png"))),
            child: Padding(
              padding: AppPadding.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.675,
                    color: Colors.transparent,
                  ),
                  Text(
                    GlobalTexts.loginBodyText,
                    textAlign: TextAlign.center,
                    style: AppFonts.baseStyle.copyWith(
                      color: AppColors.secondaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 54,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          GlobalTexts.loginButtonText,
                          style: AppFonts.baseStyle.copyWith(
                            color: AppColors.secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(GlobalTexts.createAccountText,
                      textAlign: TextAlign.center,
                      style: AppFonts.baseStyle.copyWith(
                        color: AppColors.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
            ),
          ),
          Positioned(
              right: 20,
              top: MediaQuery.of(context).size.height * 0.0774,
              child: Text(
                GlobalTexts.loginSideButtonText,
                style: AppFonts.baseStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.secondaryColor),
              ))
        ],
      ),
    );
  }
}
