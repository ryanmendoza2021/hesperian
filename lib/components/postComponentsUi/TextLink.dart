import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hesperidas/components/postComponentsUi/TextSectionBase.dart';
import 'package:hesperidas/services/NavigationRouteService.dart';

class LinkText implements TextSectionBase {
  final String text;
  final String url;

  LinkText(this.text, this.url);

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
            onTap: () => NavigationRouteService.navigateTo(url),
            splashColor: Colors.blue.withAlpha(30),
            child: Text(
              ' $text ',
              style: const TextStyle(
                color: Colors.indigo,
                fontSize: 18,
              ),
            ),
          )),
        ),
      ],
    );
  }
}
