
import 'package:flutter/material.dart';
import 'package:hesperidas/utils/FavoritesService.dart';
import 'package:hesperidas/utils/NavigationRouteService.dart';

class PostType1 extends StatelessWidget {
  const PostType1({super.key, required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card.filled(color: Colors.transparent, child: SizedBox(
            width: 300,
            height: 70,
            child: Center(child: ElevatedButton(onPressed: () {
              FavoritesService.addFavorite(NavigationRouteService.getCurrentRoute());
            }, child: const Text('Agregar a Favoritos'),)),
          )),
          Card.filled(child: SizedBox(
            width: 300,
            height: 100,
            child: Center(child: Text(cardName)),
          )),
        ],
      ),
    );
  }


}

