import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/services/BodyRouteService/InfoRouteBody.dart';
import 'package:hesperidas/services/BodyRouteService/RoutesBodyService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesBloc extends Cubit<List<InfoRouteBody>> {

  static const String _keyFavorite = 'Favorite';
  static SharedPreferences? _preferences;
  static List<String> _favorites = [];

  static initService () async {
    _preferences = await SharedPreferences.getInstance();
    _favorites = _preferences?.getStringList(_keyFavorite) ?? [];
  }

  FavoritesBloc() : super(BodyRouteServiceSearch.getDataOfRoutes(_favorites));

  void addFavorite (String route) {
    if (!_favorites.contains(route)) {
      _favorites.insert(0, route);
      _preferences?.setStringList(_keyFavorite, _favorites);
      emit(BodyRouteServiceSearch.getDataOfRoutes(_favorites));
    }
  }

  void deleteFavorite (String route) {
    if (_favorites.contains(route)) {
      _favorites.remove(route);
      _preferences?.setStringList(_keyFavorite, _favorites);
      emit(BodyRouteServiceSearch.getDataOfRoutes(_favorites));
    }
  }

  void toggleFavorite (String route) {
    if (!_favorites.contains(route)) {
      addFavorite(route);
    }
    else {
      deleteFavorite(route);
    }
    print(_favorites);
  }

  bool isFavorite(String route) {
    return _favorites.contains(route);
  }

  bool isEmpty() {
    return _favorites.isEmpty;
  }

  List<InfoRouteBody> getFavorites() {
    return state;
  }

  int getCountFavorites() {
    return state.length;
  }
}