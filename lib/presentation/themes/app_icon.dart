import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
      {super.key,
      required this.height,
      required this.width,
      required this.iconPath,
      required this.iconColor});
  final double height;
  final double width;
  final String iconPath;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(iconPath),
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class ActiveNavigationIcon extends StatelessWidget {
  const ActiveNavigationIcon(
      {super.key,
      required this.height,
      required this.width,
      required this.iconPath,
});
  final double height;
  final double width;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(iconPath),
        ),
      ),
    );
  }
}
