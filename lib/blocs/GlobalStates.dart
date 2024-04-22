import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/blocs/FavoritesBloc.dart';
import 'package:hesperidas/blocs/SearchActive.dart';
import 'package:hesperidas/blocs/SearchResultBloc.dart';

import '../services/ManagerServices.dart';

class GlobalStates {
  static final List<BlocProvider> _globalsStates = [
    BlocProvider<SearchActive>(
      create: (BuildContext context) => SearchActive(),
    ),
    BlocProvider<FavoritesBloc>(
      create: (BuildContext context) => FavoritesBloc(),
    ),
    BlocProvider<SearchResultBloc>(
      create: (BuildContext context) => SearchResultBloc(),
    ),
  ];
  static getStatesBlocks ()  {
    return _globalsStates;
  }
}