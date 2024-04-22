import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesperidas/components/postComponentsUi/TextSectionBase.dart';

class NormalText extends StatelessWidget implements TextSectionBase {
  final String text;
  final EdgeInsets margin;

  const NormalText(
    this.text, {
    super.key,
    this.margin = const EdgeInsets.only(bottom: 20),
  });

  final TextStyle textStyles = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    height: 1.5,
  );

  @override
  TextSpan buildTextSpan() {
    return TextSpan(
      text: '$text ',
      style: textStyles,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        child: Text(
          '$text ',
          style: textStyles,
        ));
  }
}
