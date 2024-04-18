import 'package:flutter/cupertino.dart';

class TextSpan extends StatelessWidget {
  final String text;

  const TextSpan(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}