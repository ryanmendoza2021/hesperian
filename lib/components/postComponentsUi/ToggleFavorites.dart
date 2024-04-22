import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/FavoritesBloc.dart';

class ToggleFavorites extends StatefulWidget {
  final String route;

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
    final blocFavoritesRead =
        BlocProvider.of<FavoritesBloc>(context, listen: false);

    return Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
        children: [
      SizedBox(
        child: Center(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(50, 50),
            padding: const EdgeInsets.symmetric(
                horizontal: 0, vertical: 0), // Ajustar el padding
          ),
          onPressed: () {
            blocFavoritesRead.toggleFavorite(route);
          },
          child: blocFavorites.isFavorite(route)
              ? const Icon(Icons.star_purple500_sharp)
              : const Icon(Icons.star_border_outlined),
        )),
      )
    ]);
  }
}
