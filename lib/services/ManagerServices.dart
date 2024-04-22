import 'package:hesperidas/blocs/FavoritesBloc.dart';
import '../blocs/SearchResultBloc.dart';
import 'BodyRouteService/RoutesBodyService.dart';

class ManagerServices {
  static initServices () async {
    RoutesBodyService.initService();
    await FavoritesBloc.initService();
    SearchResultBloc.initService();
  }
}