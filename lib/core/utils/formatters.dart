import 'package:intl/intl.dart';

class AppFormatters {
  static String time(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }
}