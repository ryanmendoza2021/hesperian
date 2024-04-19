import 'package:flutter/material.dart';
import 'package:hesperidas/components/NormalText.dart';
import 'package:hesperidas/components/TextLink.dart';
import 'package:hesperidas/components/ToggleFavorites.dart';
import 'package:hesperidas/post/BodyRouteView.dart';
import 'package:hesperidas/post/posts/PostType3.dart';
import '../../components/SpanText.dart';
import '../../components/TextSection.dart';

class PostType2 extends StatelessWidget implements BodyRouteView {
  const PostType2({super.key});

  static const String section1 =
      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using';
  static const String spanText = 'Texto en Negrita';
  static const String linkText = 'Ir al post 3';

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Colors.blue,
        child: Column(children: <Widget>[
          ToggleFavorites(route: getRoute()),
          Card.filled(
              color: Colors.white,
              child: SizedBox(
                child: Column(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextSection(
                        textWidgets: [
                          NormalText(section1),
                          SpanText(spanText),
                          NormalText(section1),
                          LinkText(linkText, const PostType3().getRoute())
                        ],
                      )),
                ]),
              )),
        ]),
      ),
    );
  }

  @override
  String getRoute() {
    return '/post2';
  }

  @override
  String getTitle() {
    return 'Publicación: Post 2';
  }

  @override
  bool isPost() {
    return true;
  }
}
