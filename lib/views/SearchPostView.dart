
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/blocs/SearchActive.dart';
import 'package:hesperidas/blocs/SearchResultBloc.dart';
import 'package:hesperidas/views/BodyRouteViewInterface.dart';
import '../services/NavigationRouteService.dart';

class SearchPostView extends StatefulWidget implements BodyRouteViewInterface{
  const SearchPostView({super.key});
  @override
  SearchPostViewState createState() => SearchPostViewState();

  @override
  String getRoute() {
    return 'SearchPostView';
  }

  @override
  String getTitle() {
    return 'Búsquedas';
  }

  @override
  bool isPost() {
    return false;
  }
}

class SearchPostViewState extends State<SearchPostView>{
  static String titleMenu = 'Resultados de búsqueda';

  @override
  Widget build(BuildContext context) {

    final searchResultBloc = BlocProvider.of<SearchResultBloc>(context, listen: true);
    final searchActiveRead = BlocProvider.of<SearchActive>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Hero(
          tag: titleMenu,
          child: Material(
            child: (!searchResultBloc.searchIsEmpty())?
            ListView.builder(
              itemCount: searchResultBloc.getCountSearchResult(),
              itemBuilder: (context, index) {
                final result = searchResultBloc.getSearchResult()[index];
                return InkWell(
                  onTap: () {
                    searchActiveRead.setSateSearch(false);
                    NavigationRouteService.navigateTo(result.getRoute(), context: context, pop: true);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(result.getTitle()),
                            tileColor: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ): const ListTile(
              title: Center(child: Text("Búsqueda no encontrada")),
              tileColor: Colors.white60,
            ),
          ),
        ),
      ),
    );
  }
}