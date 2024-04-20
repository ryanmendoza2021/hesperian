import 'package:hesperidas/utils/Utils.dart';

import 'BodyRouteView.dart';
import 'RoutesBodyService.dart';

class IndexSearchPost {
  static final Map<String, String> searchIndexSearch = {};

  static initService () {
    routesBodyViews.forEach((route, createViewFunction) {
      BodyRouteView data = RoutesBodyService.getDataOf(route);
      searchIndexSearch[Utils.clearString(data.getTitle())] = data.getRoute();
    });
  }
  static Map<String, String> getIndexForSearch () {
    return searchIndexSearch;
  }
}