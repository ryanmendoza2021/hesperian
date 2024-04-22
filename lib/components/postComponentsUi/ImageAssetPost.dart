import 'package:flutter/material.dart';
import 'package:hesperidas/components/postComponentsUi/TextSectionBase.dart';

class FullWidthImage extends StatelessWidget implements TextSectionBase {
  final String imagePath;
  final bool isNetworkImage;
  final EdgeInsets margin;
  final double? height;
  final double? width;

  const FullWidthImage({
    super.key,
    required this.imagePath,
    this.isNetworkImage = false,
    this.margin = const EdgeInsets.only(bottom: 20),
    this.height, // Altura opcional
    this.width, // Anchura opcional
  });

  @override
  Widget build(BuildContext context) {
    double finalWidth = width ?? MediaQuery.of(context).size.width;

    return Container(
      margin: margin,
      child: Image(
        image: isNetworkImage
            ? NetworkImage(imagePath)
            : AssetImage(imagePath) as ImageProvider,
        width: finalWidth,
        height: height, // Usa la altura proporcionada o null para autoajuste
        fit: BoxFit.contain ,
      ),
    );
  }

  @override
  TextSpan buildTextSpan() {
    return const TextSpan(text: 'Text');
  }
}

