import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';
import 'package:flutter_car_booking/presentation/widgets/app_textfield.dart';
import 'package:flutter_car_booking/presentation/widgets/app_text_button.dart';
import 'package:flutter_car_booking/presentation/widgets/profile_default.dart';
import './widgets/brand_card.dart';
import './widgets/car_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  final List<Map<String, dynamic>> topBrands = [
    {"id": 1, "name": "Toyota"},
    {"id": 2, "name": "BMW"},
    {"id": 3, "name": "Porsche"},
    {"id": 4, "name": "Ferrari"},
    {"id": 5, "name": "BYD"},
  ];

  final List<Map<String, dynamic>> allCars = [
    {"id": 1, "name": "Yaris Ative", "price": 1500.00},
    {"id": 2, "name": "Corolla ALTIS", "price": 3000.00},
    {"id": 3, "name": "Camry", "price": 4000.00},
    {"id": 4, "name": "Yaris Cross", "price": 2000.00},
    {"id": 5, "name": "Corolla Cross", "price": 3000.00},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundSecondary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          LucideIcons.mapPin,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your location',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Bangkok',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  ProfileDefault(size: ProfileDefaultSize.small),
                ],
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select or search your',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Favourite vehicle',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: searchController,
                      hintText: 'Search',
                      prefixIcon: Icon(
                        LucideIcons.search,
                        color: AppColors.iconPrimary,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Icon(
                        LucideIcons.slidersHorizontal,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Brands',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AppTextButton(text: 'View All', onPressed: () {}),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: topBrands.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        final brand = topBrands[index];

                        return BrandCard(brand: brand['name']);
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Cars',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AppTextButton(text: 'View All', onPressed: () {}),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    spacing: 16,
                    children: [
                      ...allCars.map((car) {
                        return CarCard(name: car['name'], price: car['price']);
                      }),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
