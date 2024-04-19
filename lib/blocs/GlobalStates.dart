import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/blocs/FavoritesBloc.dart';

class GlobalStates {
  static List<BlocProvider> globalsStates = [
    BlocProvider<FavoritesBloc>(
      create: (BuildContext context) => FavoritesBloc(),
    ),
  ];
  static getStatesBlocks () {
    return globalsStates;
  }
}