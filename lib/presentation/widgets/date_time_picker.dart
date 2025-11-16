import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';
import 'package:flutter_car_booking/presentation/widgets/app_button.dart';

class DateTimePicker extends StatefulWidget {
  final Function(DateTime) onSelected;

  const DateTimePicker({super.key, required this.onSelected});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime selectedDay = DateTime.now().add(Duration(days: 1));
  String? selectedTime;

  void openModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => buildSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openModal,
      child: Container(
        height: 56,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(LucideIcons.calendar, color: AppColors.iconPrimary),
            SizedBox(width: 16),
            Text(
              '${DateFormat('dd MMMM yyyy').format(selectedDay)}'
              '${selectedTime != null ? ', $selectedTime' : ''}',
              style: TextStyle(color: AppColors.inputText, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSheet() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.buttonSecondary,
              borderRadius: BorderRadius.circular(24),
            ),
          ),

          Text(
            'Pickup Date & Time',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),

          buildDaySelector(),
          SizedBox(height: 20),
          buildTimeSelector(),

          SizedBox(height: 24),

          AppButton(
            text: 'Confirm',
            onPressed: () {
              final date = DateFormat('HH:mm').parse(selectedTime!);

              final finalDate = DateTime(
                selectedDay.year,
                selectedDay.month,
                selectedDay.day,
                date.hour,
                date.minute,
              );

              Navigator.pop(context);
              widget.onSelected(finalDate);
            },
            type: ButtonType.primary,
          ),
        ],
      ),
    );
  }

  Widget buildDaySelector() {
    final selectedDayNotifier = ValueNotifier<DateTime>(selectedDay);

    void onSelectedDay(day) {
      selectedDayNotifier.value = day;
      setState(() {
        selectedDay = day;
      });
    }

    return SizedBox(
      height: 80,
      child: ValueListenableBuilder<DateTime>(
        valueListenable: selectedDayNotifier,
        builder: (context, selectedDay, _) {
          final now = DateTime.now();
          final tomorrow = now.add(Duration(days: 1));
          final days = List.generate(
            14,
            (i) => tomorrow.add(Duration(days: i)),
          );

          return ListView.separated(
            itemCount: days.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              final day = days[index];
              final isSelected =
                  day.year == selectedDay.year &&
                  day.month == selectedDay.month &&
                  day.day == selectedDay.day;

              return GestureDetector(
                key: ValueKey(day),
                onTap: () => onSelectedDay(day),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.buttonPrimary
                        : AppColors.buttonSecondary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('E').format(day),
                        style: TextStyle(
                          color: isSelected
                              ? Colors.black
                              : AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        DateFormat('d MMM').format(day),
                        style: TextStyle(
                          color: isSelected
                              ? Colors.black
                              : AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildTimeSelector() {
    final selectedTimeNotifier = ValueNotifier<String?>(null);

    void onSelectTime(time) {
      selectedTimeNotifier.value = time;
      setState(() => selectedTime = time);
    }

    return SizedBox(
      height: 50,
      child: ValueListenableBuilder<String?>(
        valueListenable: selectedTimeNotifier,
        builder: (context, selectedDay, _) {
          final times = generateTimeSlots();

          return ListView.separated(
            itemCount: times.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              final time = times[index];
              final isSelected = time == selectedTime;

              return GestureDetector(
                key: ValueKey(time),
                onTap: () => onSelectTime(time),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.buttonPrimary
                        : AppColors.buttonSecondary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      time,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.black
                            : AppColors.textPrimary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  List<String> generateTimeSlots() {
    List<String> times = [];

    for (int h = 6; h <= 22; h++) {
      for (int m = 0; m < 60; m += 15) {
        final time =
            '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
        times.add(time);
      }
    }

    return times;
  }
}
