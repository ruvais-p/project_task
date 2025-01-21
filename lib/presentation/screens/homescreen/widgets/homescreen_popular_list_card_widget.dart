import 'package:flutter/material.dart';
import 'package:task_project/presentation/themes/app_colors.dart';

import '../../../themes/app_icon.dart';
import '../../../themes/app_textstyles.dart';

class PopularListCard extends StatefulWidget {
  const PopularListCard({
    super.key,
    required this.title,
    required this.time,
    required this.productUrl,
    required this.calaries,
  });

  final String title;
  final String time;
  final String productUrl;
  final String calaries;

  @override
  State<PopularListCard> createState() => _PopularListCardState();
}

class _PopularListCardState extends State<PopularListCard> {
  bool _isLiked = false; // Move _isLiked here as part of the state

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width * 0.54,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.secondaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topRight,
            width: MediaQuery.of(context).size.width * 0.54 - 32,
            height: MediaQuery.of(context).size.height * 0.158,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(widget.productUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(3),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isLiked = !_isLiked;
                  });
                },
                child: _isLiked
                    ? ActiveNavigationIcon(
                        height: 16.8,
                        width: 16.8,
                        iconPath: "assets/icons/Heart_filled.png",
                      )
                    : AppIcon(
                        height: 16.8,
                        width: 16.8,
                        iconPath: "assets/icons/Heart.png",
                        iconColor: AppColors.textBlack,
                      ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            maxLines: 2,
            widget.title,
            textAlign: TextAlign.center,
            style: AppTextstyles.tileBodyTextStyle.copyWith(
              fontSize: 16,
              color: AppColors.textBlack,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppIcon(
                    height: 14,
                    width: 12,
                    iconPath: "assets/icons/Calories.png",
                    iconColor: AppColors.textGray,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${widget.calaries} Kcal",
                    style: AppTextstyles.authorTextStyle.copyWith(
                      color: AppColors.textGray,
                    ),
                  ),
                ],
              ),
              Icon(Icons.circle, size: 5, color: AppColors.textGray),
              Row(
                children: [
                  AppIcon(
                    height: 13,
                    width: 13,
                    iconPath: "assets/icons/Time Circle.png",
                    iconColor: AppColors.textGray,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${widget.time} Min",
                    style: AppTextstyles.authorTextStyle.copyWith(
                      color: AppColors.textGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
