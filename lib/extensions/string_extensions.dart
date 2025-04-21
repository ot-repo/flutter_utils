import './num_extensions.dart';

import '../utils.dart';

extension StrFormatter on String {
  String formatCurrency() {
    if (Utils.isNullOrEmpty(this)) {
      return 0.formatCurrency();
    }

    var replaced = replaceAll(",", ".");
    return num.parse(replaced).formatCurrency();
  }

  String replaceSpecialChars() {
    return replaceAll(RegExp("ı"), 'i').replaceAll(RegExp("ç"), 'c').replaceAll(RegExp("ğ"), 'g').replaceAll(RegExp("ş"), 's').replaceAll(RegExp("ü"), 'u').replaceAll(RegExp("ö"), 'o');
  }

  String format(List<String> replacements) {
    var result = this;
    for (var i = 0; i < replacements.length; i++) {
      result = result.replaceFirst("{$i}", replacements[i]);
    }

    return result;
  }
}

extension E on String {
  String lastChars(int n) => substring(length - n);
  bool isNumeric() => double.tryParse(this) != null;
  String allBeforeLastN(int n) => substring(0, length - n);
}
