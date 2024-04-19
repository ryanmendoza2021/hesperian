import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesBloc extends Cubit<List<String>> {

  static const String _keyFavorite = 'Favorite';
  static SharedPreferences? _preferences;
  static List<String> _favorites = [];

  static initService () async {
    _preferences = await SharedPreferences.getInstance();
    _favorites = _preferences?.getStringList(_keyFavorite) ?? [];
  }

  FavoritesBloc() : super(_favorites);
  void updateFavorites(List<String> favoritesUpdate) {
    emit(favoritesUpdate);
  }

  void addFavorite (String route) {
    if (!_favorites.contains(route)) {
      _favorites.insert(0, route);
      _preferences?.setStringList(_keyFavorite, _favorites);
      emit(List<String>.from(_favorites));
    }
  }

  void deleteFavorite (String route) {
    if (_favorites.contains(route)) {
      _favorites.remove(route);
      _preferences?.setStringList(_keyFavorite, _favorites);
      emit(List<String>.from(_favorites));
    }
  }

  void toggleFavorite (String route) {
    if (!_favorites.contains(route)) {
      addFavorite(route);
    }
    else {
      deleteFavorite(route);
    }
  }

  bool isFavorite(String route) {
    return _favorites.contains(route);
  }

  List<String> getFavorites() {
    return state;
  }

  int getCountFavorites() {
    return state.length;
  }
}