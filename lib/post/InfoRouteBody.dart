class InfoRouteBody {
  final String route_;
  final String title_;
  final bool isPost_;

  InfoRouteBody(
      {required this.route_, required this.title_, required this.isPost_});

  String getRoute() {
    return route_;
  }

  String getTitle() {
    return title_;
  }

  bool isPost() {
    return isPost_;
  }
}
