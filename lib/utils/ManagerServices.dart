import '../post/RoutesBodyService.dart';
import 'FavoritesService.dart';

class ManagerServices {
  static initServices () {
    RoutesBodyService.init();
    FavoritesService.initService();
  }
}