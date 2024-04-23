import 'dart:ui';

import 'package:flutter/material.dart';

class Utils {
  static clearString (String str) {
    var withDiacritics = 'áéíóúÁÉÍÓÚñÑüÜ';
    var withoutDiacritics = 'aeiouAEIOUnNuu';

    for (int i = 0; i < withDiacritics.length; i++) {
      str = str.replaceAll(withDiacritics[i], withoutDiacritics[i]).toLowerCase();
    }
    return str.replaceAll(RegExp('[\\p{P}]', unicode: true), '');
  }

  static Color fromHexString(String input) {
    String normalized = input.replaceFirst('#', '');

    if (normalized.length == 6) {
      normalized = 'FF$normalized';
    }

    final int? decimal = int.tryParse(normalized, radix: 16);
    return decimal == null ? Colors.white70 : Color(decimal);
  }
}