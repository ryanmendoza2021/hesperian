import 'package:flutter/cupertino.dart';

class Paragraph extends StatelessWidget {
  final List<Widget> textWidgets;

  const Paragraph({super.key, required this.textWidgets});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: textWidgets,
    );
  }
}