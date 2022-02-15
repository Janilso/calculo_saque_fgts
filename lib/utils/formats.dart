import 'package:intl/intl.dart';

class AppFormats {
  static String dateToFormat(DateTime date, [String format = 'MMMM yyyy']) {
    return DateFormat(format, 'pt_BR').format(date);
  }

  static String valueToMoney(double value) {
    return NumberFormat.simpleCurrency(locale: 'pt_BR').format(value);
  }

  static double stringMoneyToDouble([String value = 'R\$ 0,00']) {
    return double.parse(
        value.replaceAll('R\$ ', '').replaceAll('.', '').replaceAll(',', '.'));
  }
}
