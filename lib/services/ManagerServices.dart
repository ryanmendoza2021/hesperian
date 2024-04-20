import 'package:hesperidas/blocs/FavoritesBloc.dart';

import '../blocs/SearchResultBloc.dart';
import '../post/IndexSearchPost.dart';

class ManagerServices {
  static initServices () async {
    await FavoritesBloc.initService();
    SearchResultBloc.initService();
    IndexSearchPost.initService();
  }
}