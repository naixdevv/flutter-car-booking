import 'package:intl/intl.dart';

class AppCurrencyUtils {
  static String format(double value, String locale) {
    Intl.defaultLocale = locale;

    String currencyCode = locale == "th" ? "THB" : "USD";

    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: currencyCode == "THB" ? "฿" : "\$",
      decimalDigits: 2,
    );

    return formatter.format(value);
  }
}
