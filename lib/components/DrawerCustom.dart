import 'package:flutter/material.dart';

import '../services/BodyRouteService/InfoRouteBody.dart';
import '../services/BodyRouteService/RoutesBodyService.dart';
import '../services/NavigationRouteService.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: RoutesBodyService.getDataMenuArray().length,
        itemBuilder: (context, index) {
          InfoRouteBody infoData =
              RoutesBodyService.getDataMenuArray().elementAt(index);
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(infoData.getTitle()),
            onTap: () => NavigationRouteService.navigateTo(infoData.getRoute(),
                context: context, pop: true),
          );
        },
      ),
    );
  }
}
