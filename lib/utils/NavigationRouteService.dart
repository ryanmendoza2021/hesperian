import 'package:flutter/cupertino.dart';

class NavigationRouteService {

  static String currentRoute = '/';

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void navigateTo(String routeName, BuildContext context) {
    Navigator.pop(context);
    if (routeName != currentRoute) {
      navigatorKey.currentState!.pushNamed(routeName);
      currentRoute = routeName;
    }
  }

  static String getCurrentRoute() {
    return currentRoute;
  }

}
