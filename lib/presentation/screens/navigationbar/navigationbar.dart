import 'package:flutter/material.dart';
import 'package:task_project/presentation/themes/app_colors.dart';
import 'package:task_project/presentation/themes/app_icon.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: CustomPaint(
            painter: AppBarPainter(),
            size: Size(MediaQuery.of(context).size.width, 80),
          ),
        ),
        // Center button (Chef icon)
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 35,
          top: 50 - 95,
          child: GestureDetector(
            onTap: () => onTap(2), // Center index
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.blackColor,
              child: AppIcon(
                height: 35,
                width: 35,
                iconPath: "assets/icons/Chef.png",
                iconColor: AppColors.secondaryColor,
              ),
            ),
          ),
        ),
        // Navigation icons with tap functionality
        Positioned(
          left: 30,
          top: 50 - 30,
          child: GestureDetector(
              onTap: () => onTap(0),
              child: currentIndex == 0
                  ? ActiveNavigationIcon(
                      height: 30,
                      width: 30,
                      iconPath: "assets/icons/Active_Menu Icon.png")
                  : AppIcon(
                      height: 30,
                      width: 30,
                      iconPath: "assets/icons/Menu Icon.png",
                      iconColor: AppColors.textGray,
                    )),
        ),
        Positioned(
          left: 100,
          top: 50 - 30,
          child: GestureDetector(
            onTap: () => onTap(1),
            child: currentIndex == 1
                ? ActiveNavigationIcon(
                    height: 30,
                    width: 30,
                    iconPath: "assets/icons/Active_Menu Icon_2.png")
                : AppIcon(
                    height: 30,
                    width: 30,
                    iconPath: "assets/icons/Menu Icon-1.png",
                    iconColor: AppColors.textGray,
                  ),
          ),
        ),
        Positioned(
          right: 30,
          top: 50 - 30,
          child: GestureDetector(
            onTap: () => onTap(4),
            child: currentIndex == 4
                ? ActiveNavigationIcon(
                    height: 30,
                    width: 30,
                    iconPath: "assets/icons/Active_Menu Icon_3.png")
                : AppIcon(
                    height: 30,
                    width: 30,
                    iconPath: "assets/icons/Menu Icon 3.png",
                    iconColor: AppColors.textGray,
                  ),
          ),
        ),
        Positioned(
          right: 100,
          top: 50 - 30,
          child: GestureDetector(
            onTap: () => onTap(3),
            child: AppIcon(
              height: 30,
              width: 30,
              iconPath: "assets/icons/Menu Icon-2.png",
              iconColor: currentIndex == 3
                  ? AppColors.gradiantColor
                  : AppColors.textGray,
            ),
          ),
        ),
      ],
    );
  }
}

class AppBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.secondaryColor
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(size.width / 2 - 65, 0.0);
    path.quadraticBezierTo(
        size.width / 2 - 65 + 20, 0.0, size.width / 2 - 65 + 30, 30.0);
    path.quadraticBezierTo(
        size.width / 2 - 65 + 40, 50.0, size.width / 2 - 65 + 70, 50.0);
    path.quadraticBezierTo(
        size.width / 2 - 65 + 100, 50.0, size.width / 2 - 65 + 110, 30.0);
    path.quadraticBezierTo(
        size.width / 2 - 65 + 120, 0.0, size.width / 2 - 65 + 140, 0.0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(size.width, 0.0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 40, size.height);
    path.lineTo(40, size.width);
    path.quadraticBezierTo(0.0, size.height, 0.0, size.height - 40);
    path.lineTo(0.0, 40);
    path.quadraticBezierTo(0.0, 0.0, 40, 0.0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
