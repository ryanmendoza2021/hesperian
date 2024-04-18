
import 'package:flutter/material.dart';
import 'package:hesperidas/post/RouteGenerator.dart';
import 'package:hesperidas/utils/FavoritesService.dart';
import '../utils/NavigationRouteService.dart';


class FavoriteMenuView extends StatefulWidget {
  const FavoriteMenuView({super.key});

  @override
  FavoriteMenuViewState createState() => FavoriteMenuViewState();
}


class FavoriteMenuViewState extends State<FavoriteMenuView> {
  static String titleMenu = 'Resultados de búsqueda';
  static List<String> searchResult = [];

  static setResult (List<String> result) {
    searchResult = result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'ListTile-Hero',
          child: Material(
            child: (searchResult.isNotEmpty)?
            ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                final route = searchResult[index];
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
                            title: Text(RouteGenerator.getDataRouter(route)['nombre']),
                            tileColor: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ): const Expanded(
              child: ListTile(
                title: Text("Aquí aparecerán tus post favoritos, sólo ve a uno y dale en Agregar a Favoritos"),
                tileColor: Colors.white60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}