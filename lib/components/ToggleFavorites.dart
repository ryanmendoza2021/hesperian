import 'package:flutter/material.dart';
import 'package:hesperidas/post/BodyRouteView.dart';
import 'package:hesperidas/utils/FavoritesService.dart';
import 'package:hesperidas/utils/NavigationRouteService.dart';

class ToggleFavorites extends StatefulWidget {
  final route;
  const ToggleFavorites({super.key, required this.route});

  @override
  ToggleFavoritesState createState() => ToggleFavoritesState(route: route);
}

class ToggleFavoritesState extends State<ToggleFavorites> {
  String route;
  ToggleFavoritesState({required this.route});

  @override
  Widget build(BuildContext context) {
    return Card.filled(color: Colors.transparent, child: SizedBox(
      width: 300,
      height: 70,
      child: Center(child: ElevatedButton(onPressed: () {
        FavoritesService.toggleFavorite(route);
        setState(() {
        });
      }, child: FavoritesService.isFavorite(route) ? const Text('Quitar de Favoritos'): const Text('Agregar a Favoritos'))),
    ));
  }
}
