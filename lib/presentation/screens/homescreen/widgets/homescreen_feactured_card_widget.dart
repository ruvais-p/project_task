import 'package:flutter/material.dart';
import 'package:task_project/presentation/themes/app_colors.dart';
import 'package:task_project/presentation/themes/app_textstyles.dart';

import '../../../themes/app_icon.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({
    super.key,
    required this.userName,
    required this.time,
    required this.title,
    required this.profileUrl,
  });

  @override
  final String userName;
  final String time;
  final String title;
  final String profileUrl;
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.21182266,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/feactured_Card.png"),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextstyles.tileBodyTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.secondaryColor,
                    child: CircleAvatar(
                      radius: 13,
                      backgroundImage: NetworkImage(profileUrl),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    userName,
                    style: AppTextstyles.authorTextStyle,
                  )
                ],
              ),
              Row(
                children: [
                  AppIcon(
                      height: 16,
                      width: 16,
                      iconPath: 'assets/icons/Time Circle.png',
                      iconColor: AppColors.secondaryColor),
                  SizedBox(width: 8),
                  Text(
                    time + " Min",
                    style: AppTextstyles.authorTextStyle,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
