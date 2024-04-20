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
  const SearchPostView().getRoute(): (() => const SearchPostView()),
};

final Map<Type, Function> routesBodyViewsType = {
  PostType1: (() => const PostType1()),
  PostType2: (() => const PostType2()),
  PostType3: (() => const PostType3()),
  PostType4: (() => const PostType4()),
  PostType5: (() => const PostType5()),
  PostType6: (() => const PostType6()),
  SearchPostView: (() => const SearchPostView()),
};

final Map<Type, InfoRouteBody> routesBodyData = {

};

final InfoRouteBody dataRouteNotView = RoutesBodyService.getDataOfType(NotFoundView);


class RoutesBodyService {
  static int numMenuRoutes = 4;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var route = settings.name.toString();

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Container(
        color: Colors.white,  // Aplica el color de fondo
        child: getViewOf(route),
      ),
      transitionsBuilder: Animator.deslizar,
      transitionDuration: const Duration(milliseconds: 80), // Duración de la transición
    );
  }

  static BodyRouteView getDataOf(String route) {
    var routeBodyView = routesBodyViews[route];
    return routeBodyView != null ? routeBodyView.call() as BodyRouteView: const NotFoundView() as BodyRouteView;
  }

  static Widget getViewOf(String route) {
    var routeBodyView = routesBodyViews[route];
    return routeBodyView != null ? routeBodyView.call() as Widget: const NotFoundView() as Widget;
  }

  static Iterable<String> getMenuRoutesArray() {
    return routesBodyViews.keys.take(numMenuRoutes);
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

  static String getIndexRoute() {
    return routesBodyViews.keys.first;
  }




  static BodyRouteView getViewOfType(Type typeView) {
    var routeBodyView = routesBodyViewsType[typeView];
    return routeBodyView != null ? routeBodyView.call() as BodyRouteView: const NotFoundView() as BodyRouteView;
  }

  static initService () {
    routesBodyViewsType.forEach((type, createViewFunction) {
      BodyRouteView data = RoutesBodyService.getViewOfType(type);
      routesBodyData[type] = InfoRouteBody(route: data.getRoute(), title: data.getTitle(), isPost: data.isPost());
    });
  }

  static InfoRouteBody getDataOfType(Type typeView) {
    return routesBodyData[typeView] ?? dataRouteNotView;
  }
}
