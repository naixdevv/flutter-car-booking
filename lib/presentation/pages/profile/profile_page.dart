import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';
import './widgets/profile_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        top: false,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundSecondary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        LucideIcons.user,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Supanai Hilmee',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: const Divider(
                color: AppColors.borderSecondary,
                thickness: 1,
              ),
            ),
            ProfileTile(
              icon: LucideIcons.user,
              text: "Personal info",
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: const Divider(
                color: AppColors.borderSecondary,
                thickness: 1,
              ),
            ),
            ProfileTile(
              icon: LucideIcons.languages,
              text: "Language",
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: const Divider(
                color: AppColors.borderSecondary,
                thickness: 1,
              ),
            ),
            ProfileTile(
              icon: LucideIcons.logOut,
              text: "Log out",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
