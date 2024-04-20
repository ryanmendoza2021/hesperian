import 'package:flutter/material.dart';

class PaddingPost extends StatelessWidget {
  final List<Widget> children;
  final int horizontalPadding;
  final int verticalPadding;
  final EdgeInsets margin;

  const PaddingPost({
    super.key,
    required this.children,
    this.horizontalPadding = 20, // Padding horizontal por defecto
    this.verticalPadding = 20, // Padding vertical por defecto
    this.margin = const EdgeInsets.only(bottom: 8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding.toDouble(),
          vertical: verticalPadding.toDouble(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
