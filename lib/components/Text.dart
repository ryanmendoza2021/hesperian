import 'package:flutter/cupertino.dart';

class NormalTextWidget extends StatelessWidget {
  final String text;
  const NormalTextWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}