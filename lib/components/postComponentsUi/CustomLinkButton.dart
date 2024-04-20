import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomLinkButton extends StatelessWidget {
  final String link;
  final String label;
  final bool forceWeb;
  final EdgeInsets margin;

  const CustomLinkButton({
    super.key,
    required this.link,
    this.forceWeb = false,
    this.margin = const EdgeInsets.only(bottom: 8.0),
    this.label = 'Abrir Enlace',
  });

  @override
  Widget build(BuildContext context) {
    bool isWebUrl = Uri.parse(link).isAbsolute;

    return Container(
      width: double.infinity, // Ocupa todo el ancho disponible
      margin: margin, // Usa el margen que se pasa como parámetro
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.teal, // Color del texto del botón
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Tamaño del texto
          padding: const EdgeInsets.symmetric(vertical: 16.0), // Padding vertical
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Radio sutil para esquinas redondeadas
          ),
        ),
        onPressed: () => _handlePress(context, isWebUrl),
        child: Text(label),
      ),
    );
  }

  void _handlePress(BuildContext context, bool isWebUrl) {
    if (isWebUrl || forceWeb) {
      _launchURL();
    } else {
      Navigator.of(context).pushNamed(link);
    }
  }

  void _launchURL() async {
    if (await canLaunchUrl(link as Uri)) {
      await launchUrl(link as Uri);
    } else {
      throw 'No se pudo lanzar $link';
    }
  }
}
