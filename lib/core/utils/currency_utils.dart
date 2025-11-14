import 'package:intl/intl.dart';

class AppCurrencyUtils {
  static String format(double value) {
    return NumberFormat.currency(locale: 'th_TH', symbol: '฿').format(value);
  }
}
