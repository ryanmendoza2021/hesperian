import 'package:flutter/material.dart';
import 'package:hesperidas/post/BodyRouteView.dart';
import 'package:hesperidas/post/InfoRouteBody.dart';
import 'package:hesperidas/post/NotFoundView.dart';
import 'package:hesperidas/post/posts/PostType2.dart';
import 'package:hesperidas/post/posts/PostType3.dart';
import 'package:hesperidas/post/posts/PostType4.dart';
import 'package:hesperidas/post/posts/PostType5.dart';
import 'package:hesperidas/post/posts/PostType6.dart';
import 'package:hesperidas/utils/Animator.dart';
import '../views/SearchPostView.dart';
import 'posts/PostType1.dart';

final Map<String, Function> routesBodyViews = {
  const PostType1().getRoute(): (() => const PostType1()),
  const PostType2().getRoute(): (() => const PostType2()),
  const PostType3().getRoute(): (() => const PostType3()),
  const PostType5().getRoute(): (() => const PostType5()),
  const PostType6().getRoute(): (() => const PostType6()),
  const NotFoundView().getRoute(): (() => const NotFoundView()),
  const SearchPostView().getRoute(): (() => const SearchPostView()),
};

final Map<Type, InfoRouteBody> routesBodyData = {};

final InfoRouteBody dataRouteNotView = InfoRouteBody(
    route_: const NotFoundView().getRoute(),
    title_: const NotFoundView().getRoute(),
    isPost_: const NotFoundView().isPost());

class RoutesBodyService {
  static int numMenuRoutes = 4;

  static Route<Widget> generateRoute(RouteSettings settings) {
    var route = settings.name.toString();

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Container(
        color: Colors.white, // Aplica el color de fondo
        child: getViewOf(route),
      ),
      transitionsBuilder: Animator.deslizar,
      transitionDuration:
          const Duration(milliseconds: 80), // Duración de la transición
    );
  }

  static Route<Widget> generateRouteView(BodyRouteView newBodyView) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Container(
        color: Colors.white,
        child: newBodyView as Widget,
      ),
      transitionsBuilder: Animator.deslizar,
      transitionDuration: const Duration(milliseconds: 80),
    );
  }

  static BodyRouteView getViewOfRoute(String route) {
    var routeBodyView = routesBodyViews[route];
    return routeBodyView != null
        ? routeBodyView.call() as BodyRouteView
        : const NotFoundView() as BodyRouteView;
  }

  static Widget getViewOf(String route) {
    var routeBodyView = routesBodyViews[route];
    return routeBodyView != null
        ? routeBodyView.call() as Widget
        : const NotFoundView() as Widget;
  }

  static Iterable<InfoRouteBody> getDataMenuArray() {
    return routesBodyData.values.take(numMenuRoutes);
  }

  static Map<String, Function> getMenuRoutes() {
    return Map.fromEntries(routesBodyViews.entries.take(numMenuRoutes));
  }

  static Iterable<String> getBodyRoutesArray() {
    return routesBodyViews.keys;
  }

  static Map<String, Function> getBodyRoutes() {
    return routesBodyViews;
  }

  static Map<Type, InfoRouteBody> getBodyData() {
    return routesBodyData;
  }

  static String getIndexRoute() {
    return routesBodyViews.keys.first;
  }

  static initService() {
    routesBodyViews.forEach((route, createViewFunction) {
      BodyRouteView data = RoutesBodyService.getViewOfRoute(route);
      routesBodyData[data.runtimeType] = InfoRouteBody(
          route_: data.getRoute(),
          title_: data.getTitle(),
          isPost_: data.isPost());
    });
  }

  static InfoRouteBody getDataOfType(Type typeView) {
    return routesBodyData[typeView] ?? dataRouteNotView;
  }
}

class BodyRouteServiceSearch {
  static InfoRouteBody getDataOfType(Type typeView) {
    return routesBodyData[typeView] ?? dataRouteNotView;
  }

  static InfoRouteBody getDataOfRoute(String route) {
    for (var dataInfoObject in routesBodyData.values) {
      if (dataInfoObject.getRoute() == route) {
        return dataInfoObject;
      }
    }
    return dataRouteNotView;
  }

  static List<InfoRouteBody> getDataOfRoutes(List<String> routes) {
    List<InfoRouteBody> result = [];
    List<String> copyRoutes = List.from(routes);
    for (var dataInfoObject in routesBodyData.values) {
      for (var route in copyRoutes) {
        if (dataInfoObject.getRoute() == route) {
          result.add(dataInfoObject);
          copyRoutes.remove(route);
          break;
        }
      }
      if (routes.isEmpty) {
        break;
      }
    }
    return result;
  }
}
