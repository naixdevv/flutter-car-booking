import 'package:intl/intl.dart';

class AppFormatters {
  static String time(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }

  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
