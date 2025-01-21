import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_fonts.dart';

class PopularListCard extends StatelessWidget {
  const PopularListCard({
    super.key,
    required this.productUrl,
    required this.title,
  });

  @override
  final String productUrl;
  final String title;
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.27,
      height: MediaQuery.of(context).size.height * 0.16748,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.secondaryColor),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width * 0.27 - 16,
            height: MediaQuery.of(context).size.width * 0.27 - 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: NetworkImage(productUrl), fit: BoxFit.fill),
            ),
          ),
          Text(
            maxLines: 1,
            title,
            style: AppFonts.baseStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
