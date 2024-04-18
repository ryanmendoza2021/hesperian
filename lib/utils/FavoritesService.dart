import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {

  static const String _keyFavorite = 'Favorite';
  static SharedPreferences? _preferences;
  static List<String> _favorites = [];

  static initService () async {
     _preferences = await SharedPreferences.getInstance();
     _favorites = _preferences?.getStringList(_keyFavorite) ?? [];
  }

  static addFavorite (String route) {
    if (!_favorites.contains(route)) {
      _favorites.add(route);
      _preferences?.setStringList(_keyFavorite, _favorites);
    }
  }

  static deleteFavorite (String route) {
    if (_favorites.contains(route)) {
      _favorites.remove(route);
      _preferences?.setStringList(_keyFavorite, _favorites);
    }
  }

  static bool isFavorite(String route) {
    return _favorites.contains(route);
  }

  static List<String> getFavorites() {
    return _favorites;
  }

}