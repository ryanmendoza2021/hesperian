import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/blocs/FavoritesBloc.dart';
import 'package:hesperidas/post/RoutesBodyService.dart';

import '../services/NavigationRouteService.dart';

class FavoriteMenuView extends StatefulWidget {
  const FavoriteMenuView({super.key});

  @override
  FavoriteMenuViewState createState() => FavoriteMenuViewState();
}

class FavoriteMenuViewState extends State<FavoriteMenuView> {
  static String titleMenu = 'Tus Favoritos';

  @override
  Widget build(BuildContext context) {
    final blocFavorites = BlocProvider.of<FavoritesBloc>(context, listen: true);
    final blocFavoritesRead = BlocProvider.of<FavoritesBloc>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'ListTile-Hero',
          child: Material(
            child: (blocFavorites.getFavorites().isNotEmpty)?
              ListView.builder(
              itemCount: blocFavorites.getCountFavorites(),
              itemBuilder: (context, index) {
                final route = blocFavorites.getFavorites()[index];
                return InkWell(
                  onTap: () {
                    NavigationRouteService.navigateTo(route, context: context, pop: true);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(RoutesBodyService.getDataOf(route).getTitle()),
                            tileColor: Colors.white60,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            blocFavoritesRead.deleteFavorite(route);
                          },
                          child: const Text('Quitar Favorito'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ):  const ListTile(
              title: Center(child: Text("Aquí aparecerán tus post favoritos, sólo ve a un Post y dale en: Agregar a Favoritos")),
              tileColor: Colors.white60,
            ),
          ),
        ),
      ),
    );
  }
}
