
import 'package:flutter/material.dart';
import 'package:hesperidas/components/ToggleFavorites.dart';
import 'package:hesperidas/post/BodyRouteView.dart';

class PostType4 extends StatelessWidget implements BodyRouteView{
  const PostType4({super.key});

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
    // TODO: implement getRoute
    return '/post4';
  }

  @override
  String getTitle() {
    // TODO: implement getTitle
    return 'Publicación: Post 4';
  }

  @override
  bool isPost() {
    return true;
  }

}
