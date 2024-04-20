import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/FavoritesBloc.dart';

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
    final blocFavorites = BlocProvider.of<FavoritesBloc>(context, listen: true);
    final blocFavoritesRead = BlocProvider.of<FavoritesBloc>(context, listen: false);

    return Card.filled(color: Colors.transparent, child: SizedBox(
      width: 300,
      height: 60,
      child: Center(child: ElevatedButton(onPressed: () {
        blocFavoritesRead.toggleFavorite(route);
      }, child: blocFavorites.isFavorite(route) ? const Text('Quitar de Favoritos'): const Text('Agregar a Favoritos'))),
    ));
  }
}
