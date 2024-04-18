
import 'package:flutter/material.dart';
import 'package:hesperidas/utils/NavigationRouteService.dart';
import '../views/FavoriteMenuView.dart';
import 'DialogMenu.dart';

class ButtonNavigationBar extends StatelessWidget{
  const ButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        switch (index) {
          case 2:
            DialogMenu.show(context, child: const FavoriteMenuView());
        }
      },
      indicatorColor: Colors.amber,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.notifications_sharp)),
          label: 'Notifications',
        ),
        NavigationDestination(
          icon: Badge(
            child: Icon(Icons.star_border),
          ),
          label: 'Favoritos',
        ),
      ],
    );
  }
}