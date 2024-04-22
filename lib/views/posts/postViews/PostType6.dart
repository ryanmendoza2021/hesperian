
import 'package:flutter/material.dart';
import 'package:hesperidas/components/postComponentsUi/ToggleFavorites.dart';
import '../ImportPostViews.dart';
import '../../BodyRouteViewInterface.dart';

class PostType6 extends StatelessWidget implements BodyRouteViewInterface{
  const PostType6({super.key});

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
    return '/post6';
  }

  @override
  String getTitle() {
    return 'Publicación: Post 6';
  }

  @override
  bool isPost() {
    return true;
  }

}
