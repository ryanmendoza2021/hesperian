
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/services/BodyRouteService/InfoRouteBody.dart';
import 'package:hesperidas/services/BodyRouteService/RoutesBodyService.dart';

import '../utils/Utils.dart';

class SearchResultBloc extends Cubit<List<InfoRouteBody>> {
  static final List<InfoRouteBody> indexPost = [];

  static initService() {
    for (var datObject in RoutesBodyService.getBodyData().values) {
      indexPost.add(InfoRouteBody(
          route_: datObject.getRoute(),
          title_: Utils.clearString(datObject.getTitle()),
          isPost_: datObject.isPost()));
    }
  }

  SearchResultBloc() : super([]);

  void searchPost(String query) {
    if (query.isEmpty) {
      emit([]);
      return;
    }

    List<InfoRouteBody> searchResult = [];
    query = Utils.clearString(query);
    for (var dataObject in indexPost) {
      if (dataObject.getTitle().contains(query)) {
        searchResult.add(dataObject);
      }
      if (searchResult.length > 20) {
        break;
      }
    }
    emit(searchResult);
  }

  int getCountSearchResult() {
    return state.length;
  }

  bool searchIsEmpty() {
    return state.isEmpty;
  }

  List<InfoRouteBody> getSearchResult() {
    return state;
  }

}
