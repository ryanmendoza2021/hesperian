import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hesperidas/components/postComponentsUi/TextSectionBase.dart';
import 'package:hesperidas/services/NavigationRouteService.dart';

class LinkText extends StatelessWidget implements TextSectionBase {
  final String label;
  final String link;

  const LinkText({super.key, required this.label, required this.link});

  @override
  TextSpan buildTextSpan() {
    return TextSpan(
      style: const TextStyle(color: Colors.black),
      children: [
        WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: textLinkBuild(label: label, link: link)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return textLinkBuild(label: label, link: link);
  }

  static Widget textLinkBuild({required label, required link}) {
    return Material(
        child: InkWell(
      onTap: () => NavigationRouteService.navigateTo(link),
      splashColor: Colors.blue.withAlpha(30),
      child: Text(
        textAlign: TextAlign.start,
        '$label ',
        style: const TextStyle(
          color: Colors.indigo,
          fontSize: 16,
        ),
      ),
    ));
  }
}
