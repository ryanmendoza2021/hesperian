import 'package:flutter/material.dart';
import 'package:hesperidas/post/BodyRouteView.dart';

class NotFoundView extends StatelessWidget implements BodyRouteView{

  const NotFoundView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.error_outline,
              size: 80,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            Text(
              getTitle(),
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Volver atrás', style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }

  @override
  String getRoute() {
    return 'NotFoundView';
  }

  @override
  String getTitle() {
    return 'La página que buscas no ha sido encontrada.';
  }

  @override
  bool isPost() {
    return false;
  }
}
