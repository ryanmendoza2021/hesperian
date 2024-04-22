import 'package:flutter/material.dart';
import 'package:hesperidas/components/postComponentsUi/CustomLinkButton.dart';
import 'package:hesperidas/components/postComponentsUi/NormalText.dart';
import 'package:hesperidas/components/postComponentsUi/PaddingPost.dart';
import 'package:hesperidas/components/postComponentsUi/TextLink.dart';
import 'package:hesperidas/components/postComponentsUi/ToggleFavorites.dart';
import 'package:hesperidas/post/BodyRouteView.dart';
import 'package:hesperidas/post/InfoRouteBody.dart';
import 'package:hesperidas/post/RoutesBodyService.dart';
import 'package:hesperidas/post/posts/PostType3.dart';
import '../../components/postComponentsUi/AccordionPost.dart';
import '../../components/postComponentsUi/ImageAssetPost.dart';
import '../../components/postComponentsUi/SpanText.dart';
import '../../components/postComponentsUi/TextSection.dart';

class PostType2 extends StatelessWidget implements BodyRouteView {
  const PostType2({super.key});

  static const String section1 =
      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using';
  static const String spanText = 'Texto en Negrita';
  static const String linkText = 'Ir al post 3';

  @override
  Widget build(BuildContext context) {
    final InfoRouteBody dataPost3 = BodyRouteServiceSearch.getDataOfType(PostType3);
    return SizedBox.expand(
      child: Container(
        color: Colors.white70,
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          ToggleFavorites(route: getRoute()),
          PaddingPost(
            children: [
              TextSection(
                textWidgets: [
                  NormalText(section1),
                  SpanText(spanText),
                  NormalText(section1),
                  LinkText(label: dataPost3.getTitle(), link: dataPost3.getRoute())
                ],
              ),
              CustomAccordionList(
                sections: [
                  CustomAccordionSection(
                    header: const Text('Sección 1: Información General'),
                    content:
                        const Text('Aquí va el contenido detallado de la Sección 1.'),
                  ),
                  CustomAccordionSection(
                    header: const Text('Sección 2: Detalles Técnicos'),
                    content:
                        const Text('Aquí va el contenido detallado de la Sección 2.'),
                  ),
                  CustomAccordionSection(
                    header: const Text('Sección 3: FAQs'),
                    content:
                        const Text('Aquí va el contenido detallado de la Sección 3.'),
                  ),
                  CustomAccordionSection(
                    header: const Text('Sección 2: Detalles Técnicos'),
                    content:
                        const Text('Aquí va el contenido detallado de la Sección 2.'),
                  )
                ],
              ),
              const FullWidthImage(imagePath: 'assets/post/image1.jpg'),
              CustomLinkButton( link: dataPost3.getRoute(),label: dataPost3.getTitle())
            ],
          ),
        ])),
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
