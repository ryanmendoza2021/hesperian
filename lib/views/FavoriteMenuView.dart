import 'package:flutter/material.dart';
import 'package:hesperidas/post/RoutesBodyService.dart';
import 'package:hesperidas/utils/FavoritesService.dart';

import '../utils/NavigationRouteService.dart';


class FavoriteMenuView extends StatefulWidget {
  const FavoriteMenuView({super.key});

  @override
  FavoriteMenuViewState createState() => FavoriteMenuViewState();
}

class FavoriteMenuViewState extends State<FavoriteMenuView> {
  static String titleMenu = 'Tus Favoritos';
  static List<String> favorites = FavoritesService.getFavorites();

  deleteFavorite (route) {
    FavoritesService.deleteFavorite(route);
    setState (() {
      favorites = FavoritesService.getFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'ListTile-Hero',
          child: Material(
            child: (favorites.isNotEmpty)?
              ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final route = favorites[index];
                return InkWell(
                  onTap: () {
                    NavigationRouteService.navigateTo(route, context);
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
                            deleteFavorite(route);
                          },
                          child: const Text('Quitar Favorito'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ):  const ListTile(
              title: Text("Aquí aparecerán tus post favoritos, sólo ve a un Post y dale en: Agregar a Favoritos"),
              tileColor: Colors.white60,
            ),
          ),
        ),
      ),
    );
  }
}
