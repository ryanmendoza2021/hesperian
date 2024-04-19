import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/blocs/FavoritesBloc.dart';
import 'package:hesperidas/blocs/SearchResultBloc.dart';

class GlobalStates {
  static final List<BlocProvider> _globalsStates = [
    BlocProvider<FavoritesBloc>(
      create: (BuildContext context) => FavoritesBloc(),
    ),
    BlocProvider<SearchResultBloc>(
      create: (BuildContext context) => SearchResultBloc(),
    ),
  ];
  static getStatesBlocks () {
    return _globalsStates;
  }
}