import 'package:flutter/cupertino.dart';
import '../views/BodyRouteViewInterface.dart';
import 'BodyRouteService/RoutesBodyService.dart';

class NavigationRouteService {
  static List<String> lastRoutes = [RoutesBodyService.getIndexRoute()];

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void navigateTo(String routeName,
      {BuildContext? context, bool replacement = true, bool pop = false}) {
    if (pop && context != null) {
      Navigator.of(context).pop();
    }
    if (routeName != getCurrentRoute()) {
      if (replacement && BodyRouteServiceSearch.getDataOfRoute(routeName).isPost()) {
        navigatorKey.currentState!.pushReplacementNamed(routeName);
      } else {
        navigatorKey.currentState!.pushNamed(routeName);
      }
      updateLastRoutes(routeName);
    }
  }

  static void navigateToView(BodyRouteViewInterface routeView,
      {BuildContext? context, bool replacement = true, bool pop = false}) {
    if (pop && context != null) {
      Navigator.of(context).pop();
    }

    if (!isCurrentRouteOfRoute(routeView)) {
      if (replacement && routeView.isPost()) {
        navigatorKey.currentState!
            .pushReplacement(RoutesBodyService.generateRouteView(routeView));
      } else {
        navigatorKey.currentState!
            .push(RoutesBodyService.generateRouteView(routeView));
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

  static updateLastRoutes(String route) {
    lastRoutes.insert(0, route);
    if (lastRoutes.length > 3) {
      lastRoutes.removeLast();
    }
  }

  static bool isCurrentRouteOfType(Type routeViewType) {
    return (BodyRouteServiceSearch.getDataOfType(routeViewType).getRoute() == getCurrentRoute());
  }

  static bool isCurrentRouteOfRoute(BodyRouteViewInterface routeView) {
    return (routeView.getRoute() == getCurrentRoute());
  }
}
