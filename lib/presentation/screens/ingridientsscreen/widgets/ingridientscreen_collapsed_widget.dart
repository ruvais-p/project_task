import 'package:flutter/material.dart';
import 'package:task_project/presentation/themes/app_colors.dart';
import 'package:task_project/presentation/themes/app_icon.dart';
import 'package:task_project/presentation/themes/app_padding.dart';
import 'package:task_project/presentation/themes/app_textstyles.dart';

class CollapsedWidget extends StatelessWidget {
  const CollapsedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: AppPadding.screenPadding.copyWith(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30),
            width: 100,
            height: 8,
            decoration: BoxDecoration(
                color: AppColors.grayColor,
                borderRadius: BorderRadius.circular(16)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Healthy Taco Salad",
                style: AppTextstyles.subTitleTextStyle
                    .copyWith(fontSize: 24, color: AppColors.textBlack),
              ),
              Row(
                children: [
                  AppIcon(
                      height: 25,
                      width: 25,
                      iconPath: 'assets/icons/Time Circle.png',
                      iconColor: AppColors.textGray),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "20 Min",
                    style: AppTextstyles.authorTextStyle
                        .copyWith(color: AppColors.textGray),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text:
                        "This Healthy Taco Salad is the universal delight of taco night ",
                    style: AppTextstyles.authorTextStyle
                        .copyWith(fontSize: 16, color: AppColors.textGray)),
                TextSpan(
                    text: "View More",
                    style: AppTextstyles.authorTextStyle
                        .copyWith(fontSize: 16, color: AppColors.blackColor))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ParaComponent(
                      path: "assets/icons/Carbs.png", text: "65g carbs"),
                  SizedBox(
                    height: 20,
                  ),
                  ParaComponent(
                      path: "assets/icons/Calories.png", text: "120 Kcal"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ParaComponent(
                      path: "assets/icons/Proteins.png", text: "27g Proteins"),
                  SizedBox(
                    height: 20,
                  ),
                  ParaComponent(path: "assets/icons/Fats.png", text: "91g Fat"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ParaComponent extends StatelessWidget {
  const ParaComponent({super.key, required this.path, required this.text});

  final String path;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.107,
          height: MediaQuery.of(context).size.width * 0.107,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.grayColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: AppIcon(
              height: MediaQuery.of(context).size.width * 0.064,
              width: MediaQuery.of(context).size.width * 0.064,
              iconPath: path,
              iconColor: AppColors.textBlack),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
