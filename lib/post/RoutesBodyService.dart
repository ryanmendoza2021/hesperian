import 'package:flutter/material.dart';
import 'package:hesperidas/post/BodyRouteView.dart';
import 'package:hesperidas/post/posts/PostType2.dart';
import 'posts/PostType1.dart';

class RoutesBodyService {

  static final Map<String, Function> menuRoutes = {
    const PostType1().getRoute(): (() => const PostType1()),
    const PostType2().getRoute(): (() => const PostType2())
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var route = settings.name.toString();

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Container(
        color: Colors.white,  // Aplica el color de fondo
        child: getViewOf(route),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0); // Comienza la transición desde la derecha
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300), // Duración de la transición
    );
  }

  static BodyRouteView getDataOf(String route) {
    return menuRoutes[route]?.call() as BodyRouteView;
  }

  static Widget getViewOf(String route) {
    var viewRoute = menuRoutes[route]?.call();
    if (viewRoute != null) {
      return viewRoute as Widget;
    }
    else {
      return const Text("El Router esta iniciándose");
    }
  }

  static Iterable<String> getMenuRoutesArray() {
    return menuRoutes.keys.take(2);
  }

  static Map<String, Function> getMenuRoutes() {
    return Map.fromEntries(menuRoutes.entries.take(2));
  }

  static Iterable<String> getBodyRoutesArray() {
    return menuRoutes.keys;
  }

  static Map<String, Function> getBodyRoutes() {
    return menuRoutes;
  }

  static String getIndexRoute() {
    return menuRoutes.keys.first;
  }

  static init() {

  }

}
