import 'package:intl/intl.dart';

class AppDateUtils {
  static String shortDate(DateTime date) {
    return DateFormat('MMM d').format(date);
  }

  static String formatDate(DateTime date, String locale) {
    Intl.defaultLocale = locale;

    final formatter = DateFormat.yMMMMEEEEd(locale);
    return formatter.format(date);
  }
}