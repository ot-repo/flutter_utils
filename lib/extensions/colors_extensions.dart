import 'package:flutter/material.dart';

extension ColorExt on Colors {
  static Color fromHex(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
