import 'package:flutter/material.dart';
import 'TextSectionBase.dart';

class TextSection extends StatelessWidget {
  final List<TextSectionBase> textWidgets;

  const TextSection({super.key, required this.textWidgets});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 18),
        children: textWidgets.map((section) => section.buildTextSpan()).toList(),
      ),
    );
  }
}
