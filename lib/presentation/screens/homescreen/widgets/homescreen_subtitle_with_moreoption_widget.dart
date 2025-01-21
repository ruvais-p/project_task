
import 'package:flutter/material.dart';

import '../../../themes/app_padding.dart';
import '../../../themes/app_textstyles.dart';

class SubTitleWithMoreOption extends StatelessWidget {
  const SubTitleWithMoreOption({
    super.key, required this.title, required this.onTap,
  });

  @override
  final String title;
  final VoidCallback onTap;
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextstyles.subTitleTextStyle,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              "See All",
              style: AppTextstyles.moreOptionsTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}