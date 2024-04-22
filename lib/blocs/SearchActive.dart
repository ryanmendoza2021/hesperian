import 'package:flutter_bloc/flutter_bloc.dart';

class SearchActive extends Cubit<bool> {
  SearchActive() : super(false);

  void setSateSearch (bool newState) {
    emit(newState);
  }

  void toggleStateSearch () {
    emit(!state);
  }
}