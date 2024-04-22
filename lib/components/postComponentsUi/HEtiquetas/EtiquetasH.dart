import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class H1 extends StatelessWidget {
  final EdgeInsets margin;
  final String text;

  const H1({
    super.key,
    required this.text,
    this.margin = const EdgeInsets.only(bottom: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
    ),

    );
  }
}

class H2 extends StatelessWidget {
  final EdgeInsets margin;
  final String text;

  const H2({
    super.key,
    required this.text,
    this.margin = const EdgeInsets.only(bottom: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      ),

    );
  }
}

class H3 extends StatelessWidget {
  final EdgeInsets margin;
  final String text;

  const H3({
    super.key,
    required this.text,
    this.margin = const EdgeInsets.only(bottom: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),

    );
  }
}

class H4 extends StatelessWidget {
  final EdgeInsets margin;
  final String text;

  const H4({
    super.key,
    required this.text,
    this.margin = const EdgeInsets.only(bottom: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),

    );
  }
}