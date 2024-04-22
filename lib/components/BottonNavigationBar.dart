
import 'package:flutter/material.dart';
import '../services/NavigationRouteService.dart';
import '../views/FavoriteMenuView.dart';
import '../views/posts/postViews/PostType1.dart';
import 'DialogMenu.dart';

class ButtonNavigationBar extends StatelessWidget{
  const ButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        switch (index) {
          case 0:
            NavigationRouteService.navigateToView(const PostType1());
          case 2:
            DialogMenu.show(context, child: const FavoriteMenuView());
        }
      },
      indicatorColor: Colors.amber,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home_outlined), label: 'Inicio',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.notifications_sharp)),
          label: 'Notifications',
        ),
        NavigationDestination(
          icon: Icon(Icons.star_border), label: 'Favoritos',
        ),
      ],
    );
  }
}