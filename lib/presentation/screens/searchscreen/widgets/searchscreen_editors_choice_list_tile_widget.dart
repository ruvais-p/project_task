import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_fonts.dart';
import '../../../themes/app_textstyles.dart';

class EditorsChoiceListTile extends StatelessWidget {
  const EditorsChoiceListTile({
    super.key,
    required this.productUrl,
    required this.userUrl,
    required this.title,
    required this.author,
    required this.onTap,
  });
  final String productUrl;
  final String userUrl;
  final String title;
  final String author;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12315,
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.27,
            height: MediaQuery.of(context).size.height * 0.10345,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(productUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFonts.baseStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.textGray,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                            userUrl,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        maxLines: 1,
                        author,
                        style: AppTextstyles.authorTextStyle
                            .copyWith(color: AppColors.textGray),
                      )
                    ],
                  ),
                )
              ],
            ),
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
              child: IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    Icons.arrow_forward,
                    color: AppColors.secondaryColor,
                    size: MediaQuery.of(context).size.width * 0.0374,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
