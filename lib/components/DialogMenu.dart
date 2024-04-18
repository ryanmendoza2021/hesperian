import 'package:flutter/material.dart';

class DialogMenu {

  static defaultView () {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card.filled(child: SizedBox(
            width: 300,
            height: 100,
            child: Center(child: Text("Ingresa un Menú")),
          )),
        ],
      ),
    );
  }


  static show(BuildContext context, {Widget? child}) {

  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    barrierDismissible: false,  // Establece esto en true si quieres permitir tocar fuera para cerrar el diálogo.
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Favoritos'),
          ),
          body: child ?? defaultView(),
          ),
      );
    },
  );
}
}


