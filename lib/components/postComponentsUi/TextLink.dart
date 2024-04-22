import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hesperidas/components/postComponentsUi/TextSectionBase.dart';
import 'package:hesperidas/services/NavigationRouteService.dart';

class LinkText implements TextSectionBase {
  final String label;
  final String link;

  LinkText({required this.label,required this.link});

  @override
  TextSpan buildTextSpan() {
    return TextSpan(
      // Utiliza WidgetSpan para integrar el widget en el RichText
      style: const TextStyle(color: Colors.black),
      children: [
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Material(
              child: InkWell(
            onTap: () => NavigationRouteService.navigateTo(link),
            splashColor: Colors.blue.withAlpha(30),
            child: Text(
              '$label ',
              style: const TextStyle(
                color: Colors.indigo,
                fontSize: 16,
              ),
            ),
          )),
        ),
      ],
    );
  }
}
