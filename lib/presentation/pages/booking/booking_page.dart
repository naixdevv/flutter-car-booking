import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';
import 'package:flutter_car_booking/presentation/widgets/app_button.dart';
import 'package:flutter_car_booking/presentation/widgets/app_text_button.dart';
import 'package:flutter_car_booking/presentation/widgets/app_textfield.dart';
import 'package:flutter_car_booking/presentation/widgets/car_card.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final startController = TextEditingController();
  final dateController = TextEditingController();
  final ageController = TextEditingController();

  final List<Map<String, dynamic>> recommendedCar = [
    {"id": 1, "name": "Yaris Ative", "price": 1500.00},
    {"id": 2, "name": "Corolla ALTIS", "price": 3000.00},
    {"id": 3, "name": "Camry", "price": 4000.00},
    {"id": 4, "name": "Yaris Cross", "price": 2000.00},
    {"id": 5, "name": "Corolla Cross", "price": 3000.00},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        titleSpacing: 24,
        backgroundColor: AppColors.backgroundPrimary,
      ),
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.backgroundSecondary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search for a Car',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Find your favourite car to rent',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(color: AppColors.borderPrimary, thickness: 1),
                    SizedBox(height: 8),
                    AppTextField(
                      controller: startController,
                      hintText: 'Suvarnabhumi Airport (BKK)',
                      prefixIcon: Icon(
                        LucideIcons.carFront,
                        color: AppColors.iconPrimary,
                      ),
                      fillColor: AppColors.backgroundPrimary,
                    ),
                    SizedBox(height: 16),
                    AppTextField(
                      controller: dateController,
                      hintText: '18 Nov 10:00 PM - 21 Nov 10:00 PM',
                      prefixIcon: Icon(
                        LucideIcons.calendar,
                        color: AppColors.iconPrimary,
                      ),
                      fillColor: AppColors.backgroundPrimary,
                    ),
                    SizedBox(height: 16),
                    AppTextField(
                      controller: ageController,
                      hintText: 'Age between 25-60',
                      prefixIcon: Icon(
                        LucideIcons.user,
                        color: AppColors.iconPrimary,
                      ),
                      fillColor: AppColors.backgroundPrimary,
                    ),
                    SizedBox(height: 8),
                    Divider(color: AppColors.borderPrimary, thickness: 1),
                    SizedBox(height: 8),
                    AppButton(
                      text: 'Search',
                      onPressed: () {},
                      type: ButtonType.primary,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Divider(color: AppColors.borderSecondary, thickness: 1),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended Car',
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
                      ...recommendedCar.map((car) {
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
