import 'package:intl/intl.dart';

import '../utils.dart';

extension Formatter on num {
  String formatCurrency({bool ignoreCurrencySymbol = false, String locale = "de", String currencySymbol = "€"}) {
    var formatter = NumberFormat.currency(locale: locale, symbol: "");
    return formatter.format(this).trim() + (!ignoreCurrencySymbol && !Utils.isNullOrEmpty(currencySymbol) ? currencySymbol : "");
  }
}
