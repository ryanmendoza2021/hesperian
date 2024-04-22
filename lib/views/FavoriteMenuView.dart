import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/blocs/FavoritesBloc.dart';
import 'package:hesperidas/services/BodyRouteService/RoutesBodyService.dart';

import '../services/BodyRouteService/InfoRouteBody.dart';
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
            child: !blocFavorites.isEmpty()?
              ListView.builder(
              itemCount: blocFavorites.getCountFavorites(),
              itemBuilder: (context, index) {
                final InfoRouteBody dataObject = blocFavorites.getFavorites()[index];
                return InkWell(
                  onTap: () {
                    NavigationRouteService.navigateTo(dataObject.getRoute(), context: context, pop: true);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(dataObject.getTitle()),
                            tileColor: Colors.white60,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            blocFavoritesRead.deleteFavorite(dataObject.getRoute());
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
