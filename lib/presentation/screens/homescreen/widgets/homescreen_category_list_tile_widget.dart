import 'package:flutter/material.dart';

import '../../../themes/app_textstyles.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.title,
    required this.bgColor,
  });

  @override
  final String title;
  final Color bgColor;
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 41,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(40)),
      child: Text(
        title,
        style: AppTextstyles.authorTextStyle.copyWith(
          fontSize: 16,
        ),
      ),
    );
  }
}
