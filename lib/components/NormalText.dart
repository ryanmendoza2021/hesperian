import 'package:flutter/cupertino.dart';
import 'package:hesperidas/components/TextSectionBase.dart';

class NormalText implements TextSectionBase {
  final String text;

  NormalText(this.text);
  @override
  TextSpan buildTextSpan() {
    return TextSpan(text: text, style: const TextStyle(fontSize: 18));
  }
}