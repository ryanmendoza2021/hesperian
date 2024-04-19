import 'package:flutter/cupertino.dart';
import 'package:hesperidas/post/BodyRouteView.dart';
import '../post/RoutesBodyService.dart';

class NavigationRouteService {

  static List<String> lastRoutes = [RoutesBodyService.getIndexRoute()];

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void navigateTo(String routeName, {BuildContext? context, bool replacement = true, bool pop  = false}) {
    if (pop && context != null) {
      Navigator.of(context).pop();
    }
    if (routeName != getCurrentRoute()) {
      navigatorKey.currentState!.pushReplacementNamed(routeName);
      updateLastRoutes(routeName);
    }
  }

  static void navigateToView(BodyRouteView routeView, {bool replacement = true, bool pop  = false}) {
    if (routeView.getRoute() != getCurrentRoute()) {
      if (replacement) {
        navigatorKey.currentState!.pushReplacementNamed(routeView.getRoute());
      }
      else{
        navigatorKey.currentState!.pushNamed(routeView.getRoute());
      }

      updateLastRoutes(routeView.getRoute());
    }
  }

  static goBack() {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
      lastRoutes.removeAt(0);
    }
  }

  static String getCurrentRoute() {
    return lastRoutes.first;
  }

  static updateLastRoutes (String route) {
    lastRoutes.insert(0, route);
    if (lastRoutes.length > 3) {
      lastRoutes.removeLast();
    }
  }

  static bool isCurrentRoute (BodyRouteView routeView) {
    return (routeView.getRoute() == getCurrentRoute());
  }

}
