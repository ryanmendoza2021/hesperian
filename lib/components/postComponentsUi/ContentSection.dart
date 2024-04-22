import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';

class ContentSection extends StatelessWidget {
  final String text; // Texto principal
  final List<Widget> dropCapContent; // Contenido del drop cap
  final double dropCapWidth; // Ancho del drop cap
  final double dropCapHeight; // Altura del drop cap
  final double dropCapBasePadding; // Base del padding del drop cap
  final DropCapPosition dropCapPosition; // Posición del drop cap
  final TextAlign textAlign; // Alineación del texto
  final TextStyle textStyle; // Estilo del texto
  final bool parseMarkdown; // Interpretar Markdown o no
  final EdgeInsets padding;

  const ContentSection({
    super.key,
    required this.text,
    required this.dropCapContent,
    this.dropCapWidth = 200,
    this.dropCapHeight = 160,
    this.dropCapBasePadding = 0,
    this.dropCapPosition = DropCapPosition.start,
    this.textAlign = TextAlign.start,
    this.textStyle = const TextStyle(fontSize: 18.0, height: 1.5),
    this.parseMarkdown = false,
    this.padding = const EdgeInsets.only(bottom: 20),
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets dropCapPadding;
    if (dropCapPosition == DropCapPosition.start) {
      dropCapPadding = EdgeInsets.only(
        bottom: dropCapBasePadding + 8,
        right: dropCapBasePadding + 8,
      );
    } else {
      dropCapPadding = EdgeInsets.only(
        bottom: dropCapBasePadding + 8,
        left: dropCapBasePadding + 8,
      );
    }

    DropCap dropCap = DropCap(
      width: dropCapWidth, // Ancho del drop cap
      height: dropCapHeight, // Altura del drop cap
      child: Padding(
        padding: dropCapPadding, // Padding definido
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: dropCapContent, // Contenido del drop cap
          ),
        ),
      ),
    );

    return Padding(
      padding: padding,
      child: DropCapText(
        text,
        parseInlineMarkdown: parseMarkdown,
        dropCapPosition: dropCapPosition,
        dropCap: dropCap,
        textAlign: textAlign,
        style: textStyle, // Estilo general del texto
      ),
    );
  }
}
