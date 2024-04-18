import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  final String text;
  final String url;

  const TextLink(this.text, this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => Navegator Route o Web(url)
      child: Text(
        text,
        style: const TextStyle(color: Colors.blue),
      ),
    );
  }
}