// ignore_for_file: public_member_api_docs, sort_constructors_first
// ingredients_screen.dart
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:task_project/presentation/themes/app_colors.dart';
import 'package:task_project/presentation/themes/app_icon.dart';

import 'widgets/ingridientscreen_collapsed_widget.dart';
import 'widgets/ingridientscreen_panel_widget.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({
    Key? key,
    required this.producturl,
  }) : super(key: key);
  final String producturl;

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        color: AppColors.primaryColor,
        minHeight: MediaQuery.of(context).size.height * 0.35,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.68,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: NetworkImage(
                    widget
                        .producturl, // Use widget.producturl to access the property
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIconButton(
                        icon: Icons.close,
                        onTap: () {
                          Navigator.of(context).pop(); // Close the screen
                        },
                      ),
                      _buildCustomIcon(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        panel: const PanelWidget(),
        collapsed: const CollapsedWidget(),
      ),
    );
  }

  Widget _buildIconButton(
      {required IconData icon, required VoidCallback onTap}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.107,
      height: MediaQuery.of(context).size.width * 0.107,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryColor,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: AppColors.blackColor,
          size: MediaQuery.of(context).size.width * 0.064,
        ),
      ),
    );
  }

  Widget _buildCustomIcon() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.107,
      height: MediaQuery.of(context).size.width * 0.107,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryColor,
      ),
      child: AppIcon(
        height: 30,
        width: 30,
        iconPath: 'assets/icons/Heart.png',
        iconColor: AppColors.blackColor,
      ),
    );
  }
}
