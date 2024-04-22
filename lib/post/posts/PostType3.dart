
import 'package:flutter/material.dart';
import 'package:hesperidas/components/postComponentsUi/NormalText.dart';
import 'package:hesperidas/post/BodyRouteView.dart';

import '../../components/postComponentsUi/AccordionPost.dart';
import '../../components/postComponentsUi/ContentSection.dart';
import '../../components/postComponentsUi/CustomLinkButton.dart';
import '../../components/postComponentsUi/HEtiquetas/EtiquetasH.dart';
import '../../components/postComponentsUi/ImageAssetPost.dart';
import '../../components/postComponentsUi/LayoutPost.dart';
import '../../components/postComponentsUi/PaddingPost.dart';
import '../../components/postComponentsUi/SpanText.dart';
import '../../components/postComponentsUi/TextLink.dart';
import '../../components/postComponentsUi/TextSection.dart';
import '../InfoRouteBody.dart';
import '../RoutesBodyService.dart';
import 'PostType2.dart';

class PostType3 extends StatelessWidget implements BodyRouteView{
  const PostType3({super.key});
  static const String section2 =
      'It is a long established fact that a reader will long established fact that a reader will be distracted by the readable content of a page whelong established fact that a reader will be distracted by the readable content of a page whelong established fact that a reader will be distracted by the readable content of a page whelong established fact that a reader will be distracted by the readable content of a page whelong established fact that a reader will be distracted by the readable content of a page whebe distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using';

  static const String section1 =
      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using';
  static const String spanText = 'Texto en Negrita';
  static const String linkText = 'Ir al post 3';

  @override
  Widget build(BuildContext context) {
    final InfoRouteBody dataPost2 =
    BodyRouteServiceSearch.getDataOfType(PostType2);

    return LayoutPost(
        route: getRoute(),
        isPost: isPost(),
        children: <Widget>[
          const FullWidthImage(
            imagePath: 'assets/post/image1.jpg',
          ),
          PaddingPost(
            children: [
              const NormalText(section1),
              TextSection(
                textWidgets: [
                  const NormalText(section1),
                  SpanText(spanText),
                  const NormalText(section1),
                  LinkText(
                      label: dataPost2.getTitle(), link: dataPost2.getRoute()),
                ],
              ),
              CustomAccordionList(
                sections: [
                  CustomAccordionSection(
                    header: const Text('Sección 1: Información General'),
                    content: const Text(
                        'Aquí va el contenido detallado de la Sección 1.'),
                  ),
                  CustomAccordionSection(
                    header: const Text('Sección 2: Detalles Técnicos'),
                    content: const Text(
                        'Aquí va el contenido detallado de la Sección 2.'),
                  ),
                  CustomAccordionSection(
                    header: const Text('Sección 3: FAQs'),
                    content: const Text(
                        'Aquí va el contenido detallado de la Sección 3.'),
                  ),
                  CustomAccordionSection(
                    header: const Text('Sección 2: Detalles Técnicos'),
                    content: const Text(
                        'Aquí va el contenido detallado de la Sección 2.'),
                  )
                ],
              ),
              const FullWidthImage(imagePath: 'assets/post/image1.jpg'),
              CustomLinkButton(
                  link: dataPost2.getRoute(), label: dataPost2.getTitle()),
              const H1(text: 'Esta es una etiqueta H1'),
              const H2(text: 'Esta es una etiqueta H2'),
              const H3(text: 'Esta es una etiqueta H3'),
              const H4(text: 'Esta es una etiqueta H4'),
              const ContentSection(
                dropCapContent: [
                  FullWidthImage(
                    margin: EdgeInsets.all(0),
                    imagePath: 'assets/post/image1.jpg',
                  ),
                ],
                text: section2,
              ),
              LinkText(label: dataPost2.getTitle(), link: dataPost2.getRoute()),
            ],
          ),
        ]);
  }

  @override
  String getRoute() {
    return '/post3';
  }

  @override
  String getTitle() {
    return 'Publicación: Post 3, Texto continuo y en medio';
  }

  @override
  bool isPost() {
    return true;
  }

}
