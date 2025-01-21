import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_icon.dart';
import '../../../themes/app_textstyles.dart';

class FavoriteListTile extends StatelessWidget {
  const FavoriteListTile({
    super.key,
    required this.productUrl,
    required this.profileUrl,
    required this.username,
    required this.title,
  });

  final String productUrl;
  final String profileUrl;
  final String username;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.25,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(bottom: 8),
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(productUrl))),
            child: Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.075,
              height: MediaQuery.of(context).size.width * 0.075,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondaryColor),
              child: AppIcon(
                  height: MediaQuery.of(context).size.width * 0.04,
                  width: MediaQuery.of(context).size.width * 0.04,
                  iconPath: "assets/icons/Heart_filled.png",
                  iconColor: AppColors.gradiantColor),
            ),
          ),
          Text(
            maxLines: 2,
            title,
            style: AppTextstyles.tileBodyTextStyle
                .copyWith(fontSize: 16, color: AppColors.blackColor),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.032,
                backgroundColor: AppColors.gradiantColor,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.032 - 2,
                  backgroundImage: NetworkImage(profileUrl),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                username,
                style: AppTextstyles.authorTextStyle
                    .copyWith(color: AppColors.textGray),
              )
            ],
          )
        ],
      ),
    );
  }
}
