import 'dart:ffi';

abstract class BodyRouteView {
  String getRoute();
  String getTitle();
  bool isPost();
}