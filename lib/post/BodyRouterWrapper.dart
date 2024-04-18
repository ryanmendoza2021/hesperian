class BodyRouterWrapper {
  final void Function() getRoute;
  final Function create;

  BodyRouterWrapper(this.getRoute, this.create);
}