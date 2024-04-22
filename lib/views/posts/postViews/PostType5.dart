
import 'package:flutter/material.dart';
import 'package:hesperidas/components/postComponentsUi/ToggleFavorites.dart';
import '../../BodyRouteViewInterface.dart';

class PostType5 extends StatelessWidget implements BodyRouteViewInterface{
  const PostType5({super.key});

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
    return '/post5';
  }

  @override
  String getTitle() {
    return 'Publicación: Post 5';
  }

  @override
  bool isPost() {
    return true;
  }

}
