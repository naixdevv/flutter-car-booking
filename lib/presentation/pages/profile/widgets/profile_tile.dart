import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';

class ProfileTile extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onTap;

  const ProfileTile({
    super.key,
    this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 4),
      color: Colors.transparent,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 24),
        leading: icon != null ? Icon(icon, size: 24, color: AppColors.iconPrimary) : null,
        title: Text(text, style: TextStyle(color: AppColors.textPrimary)),
        trailing: const Icon(LucideIcons.chevronRight, size: 24, color: AppColors.iconPrimary),
        onTap: onTap,
      ),
    );
  }
}
