import 'package:flutter/material.dart';

class FullWidthImage extends StatelessWidget {
  final String imagePath;
  final bool isNetworkImage;
  final EdgeInsets margin; // Parámetro para el margen

  const FullWidthImage({
    super.key,
    required this.imagePath,
    this.isNetworkImage = false,
    this.margin =
        const EdgeInsets.only(bottom: 20), // Valor por defecto para el margen
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin, // Aplica el margen recibido
      child: Image(
        image: isNetworkImage
            ? NetworkImage(imagePath)
            : AssetImage(imagePath) as ImageProvider,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
