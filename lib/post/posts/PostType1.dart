
import 'package:flutter/material.dart';
import 'package:hesperidas/components/ToggleFavorites.dart';
import 'package:hesperidas/post/BodyRouteView.dart';

class PostType1 extends StatelessWidget implements BodyRouteView{
  const PostType1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ToggleFavorites(route: getRoute()),
          Card.filled(child: SizedBox(
            width: 300,
            height: 100,
            child: Center(child: Text(getTitle())),
          )),
        ],
      ),
    );
  }

  @override
  String getRoute() {
    return '/post1';
  }

  @override
  String getTitle() {
    return 'Publicación: Pantalla de Inicio';
  }

  @override
  bool isPost() {
    return true;
  }

}
