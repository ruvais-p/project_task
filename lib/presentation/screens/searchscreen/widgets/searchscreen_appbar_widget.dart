import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_fonts.dart';

class SearchScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchScreenAppbar({
    super.key,
    required this.onPressed,
  });

  @override
  final VoidCallback onPressed;
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_outlined,
          size: 24,
        ),
        onPressed: onPressed,
      ),
      centerTitle: true,
      title: Text(
        "Search",
        style: AppFonts.baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textBlack,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
