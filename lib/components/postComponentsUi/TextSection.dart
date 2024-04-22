import 'package:flutter/material.dart';
import 'TextSectionBase.dart';

class TextSection extends StatelessWidget {
  final List<TextSectionBase> textWidgets;
  final EdgeInsets margin;

  const TextSection({
    super.key,
    required this.textWidgets,
    this.margin = const EdgeInsets.only(bottom: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 16, height: 1.5),
          children: textWidgets.map((section) => section.buildTextSpan()).toList(),
        ),
      ),
    );
  }
}