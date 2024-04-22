import 'package:flutter/cupertino.dart';

import 'TextSectionBase.dart';

class SpanText implements TextSectionBase {
  final String text;

  SpanText(this.text);

  @override
  TextSpan buildTextSpan() {
    return TextSpan(
      text: '$text ',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}