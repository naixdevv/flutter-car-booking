import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';
import 'package:flutter_car_booking/core/utils/currency_utils.dart';

class TripPage extends StatefulWidget {
  const TripPage({super.key});

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  final Map<String, List<Map<String, dynamic>>> tripsData = {
    "2025-01-10": [
      {
        "from": "Central Plaza",
        "to": "Siam Paragon",
        "price": 120.00,
        "time": "14:20",
      },
      {"from": "Home", "to": "Airport", "price": 240.00, "time": "09:10"},
    ],
    "2025-01-09": [
      {
        "from": "Bangkok Hospital",
        "to": "Samyan",
        "price": 80.00,
        "time": "18:40",
      },
    ],
    "2025-02-10": [
      {
        "from": "Central Plaza",
        "to": "Siam Paragon",
        "price": 120.00,
        "time": "14:20",
      },
      {"from": "Home", "to": "Airport", "price": 240.00, "time": "09:10"},
    ],
    "2025-03-10": [
      {
        "from": "Central Plaza",
        "to": "Siam Paragon",
        "price": 120.00,
        "time": "14:20",
      },
      {"from": "Home", "to": "Airport", "price": 240.00, "time": "09:10"},
    ],
    "2025-04-10": [
      {
        "from": "Central Plaza",
        "to": "Siam Paragon",
        "price": 120.00,
        "time": "14:20",
      },
      {"from": "Home", "to": "Airport", "price": 240.00, "time": "09:10"},
    ],
    "2025-05-10": [
      {
        "from": "Central Plaza",
        "to": "Siam Paragon",
        "price": 120.00,
        "time": "14:20",
      },
      {"from": "Home", "to": "Airport", "price": 240.00, "time": "09:10"},
    ],
    "2025-06-10": [
      {
        "from": "Central Plaza",
        "to": "Siam Paragon",
        "price": 120.00,
        "time": "14:20",
      },
      {"from": "Home", "to": "Airport", "price": 240.00, "time": "09:10"},
    ],
    "2025-07-10": [
      {
        "from": "Central Plaza",
        "to": "Siam Paragon",
        "price": 120.00,
        "time": "14:20",
      },
      {"from": "Home", "to": "Airport", "price": 240.00, "time": "09:10"},
    ],
    "2025-08-10": [
      {
        "from": "Central Plaza",
        "to": "Siam Paragon",
        "price": 120.00,
        "time": "14:20",
      },
      {"from": "Home", "to": "Airport", "price": 240.00, "time": "09:10"},
    ],
    "2025-09-10": [
      {
        "from": "Central Plaza",
        "to": "Siam Paragon",
        "price": 120.00,
        "time": "14:20",
      },
      {"from": "Home", "to": "Airport", "price": 240.00, "time": "09:10"},
    ],
    "2025-10-10": [
      {
        "from": "Central Plaza",
        "to": "Siam Paragon",
        "price": 120.00,
        "time": "14:20",
      },
      {"from": "Home", "to": "Airport", "price": 240.00, "time": "09:10"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My trips',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        titleSpacing: 24,
        backgroundColor: AppColors.backgroundPrimary,
      ),
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: tripsData.keys.length,
          separatorBuilder: (_, __) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: const Divider(
              color: AppColors.borderSecondary,
              thickness: 1,
            ),
          ),
          itemBuilder: (context, index) {
            final date = tripsData.keys.elementAt(index);
            final trips = tripsData[date]!;
        
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
        
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    date,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
        
                SizedBox(height: 8),
        
                ...trips.map((trip) {
                  return Card(
                    elevation: 0,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    color: Colors.transparent,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundSecondary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          LucideIcons.carFront,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        '${trip['from']} → ${trip['to']}',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        '${trip['time']}, ${AppCurrencyUtils.format(trip['price'], 'th')}',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
        
                      }
                    ),
                  );
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}
