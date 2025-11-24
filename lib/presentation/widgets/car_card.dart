import 'package:flutter/material.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';
import 'package:flutter_car_booking/core/utils/currency_utils.dart';

class CarCard extends StatelessWidget {
  final String name;
  final double price;

  const CarCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Automatic',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        AppCurrencyUtils.format(price, 'th'),
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '/ Day',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
