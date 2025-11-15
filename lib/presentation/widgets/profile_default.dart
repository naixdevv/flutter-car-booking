import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';

enum ProfileDefaultSize { small, medium, large }

class ProfileDefault extends StatelessWidget {
  final ProfileDefaultSize? size;

  const ProfileDefault({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    double width;
    double height;
    double iconSize;

    switch (size) {
      case ProfileDefaultSize.small:
        width = 50;
        height = 50;
        iconSize = 25;
        break;
      case ProfileDefaultSize.medium:
        width = 75;
        height = 75;
        iconSize = 40;
        break;
      default:
        width = 100;
        height = 100;
        iconSize = 50;
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        LucideIcons.user,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}