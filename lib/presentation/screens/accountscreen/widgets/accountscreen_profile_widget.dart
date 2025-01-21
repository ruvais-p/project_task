import 'package:flutter/material.dart';
import 'package:task_project/presentation/themes/app_fonts.dart';
import 'package:task_project/presentation/themes/app_padding.dart';

import '../../../themes/app_colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.userUrl,
    required this.title,
    required this.author,
    required this.onTap,
  });

  final String userUrl;
  final String title;
  final String author;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: AppPadding.screenPadding,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12315,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.gradiantColor,
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(userUrl),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    author,
                    style: AppFonts.baseStyle.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: AppColors.textBlack),
                  ),
                  Text(
                    title,
                    style: AppFonts.baseStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromRGBO(72, 82, 95, 1)),
                  )
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            width: 60,
            height: MediaQuery.of(context).size.height,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.07,
              height: MediaQuery.of(context).size.width * 0.07,
              decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.secondaryColor,
                size: MediaQuery.of(context).size.width * 0.0374,
              ),
            ),
          )
        ],
      ),
    );
  }
}
