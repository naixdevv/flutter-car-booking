import 'package:intl/intl.dart';

class AppDateUtils {
  static String shortDate(DateTime date) {
    return DateFormat('MMM d').format(date);
  }
}