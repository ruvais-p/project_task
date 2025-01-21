import 'package:flutter/material.dart';
import 'package:task_project/presentation/themes/app_colors.dart';

import '../../../themes/app_fonts.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.url,
    required this.item,
  });
  final String url, item;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  color: AppColors.grayColor,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      url,
                    ),
                  ),
                ),
              ),
              Text(
                item,
                style: AppFonts.baseStyle.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.gradiantColor,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.gradiantColor,
                  size: 16,
                ),
              ),
              Text(
                "1",
                style: AppFonts.baseStyle.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: AppColors.blackColor,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.gradiantColor,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  Icons.remove,
                  color: AppColors.gradiantColor,
                  size: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
