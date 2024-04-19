import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/post/IndexSearchPost.dart';

import '../utils/Utils.dart';

class SearchResultBloc extends Cubit<List<String>> {
  static late Map<String, String> indexPost;
  static final Map<String, String> _searchResult = {};

  static initService() {
    // Inicializar con claves que también son los valores
    indexPost = IndexSearchPost.getIndexForSearch();
  }

  SearchResultBloc() : super(_searchResult.values.toList());

  void searchPost(String query) {
    _searchResult.clear();
    for (var indexTitle in indexPost.keys) {
      if (indexTitle.contains(Utils.clearString(query)) && indexPost[indexTitle] != null) {
        _searchResult[indexTitle] = indexPost[indexTitle]!;
      }
      if (_searchResult.length > 20) {
        break;
      }
    }
    emit(List<String>.from(_searchResult.keys));
  }

  void clearSearch() {
    _searchResult.clear();
    emit(List<String>.from(_searchResult.keys));
  }

  int getCountSearchResult() {
    return state.length;
  }

  bool searchIsEmpty() {
    return !state.isNotEmpty;
  }

  List<String> getSearchResult() {
    return state;
  }

  String getRouteOfResult(String key) {
    return _searchResult[key] ?? '';
  }
}
