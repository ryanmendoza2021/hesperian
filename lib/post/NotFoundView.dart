import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
  final String message;

  const NotFoundView({
    super.key,
    this.message = "La página que buscas no ha sido encontrada.",
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
              message,
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
              child: Text('Volver atrás'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
              ),
            )
          ],
        ),
      ),
    );
  }
}
