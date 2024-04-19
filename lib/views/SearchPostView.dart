
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/blocs/SearchResultBloc.dart';
import 'package:hesperidas/post/BodyRouteView.dart';
import 'package:hesperidas/post/RoutesBodyService.dart';
import '../utils/NavigationRouteService.dart';


class SearchPostView extends StatefulWidget implements BodyRouteView{
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

    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'ListTile-Heroo',
          child: Material(
            child: (!searchResultBloc.searchIsEmpty())?
            ListView.builder(
              itemCount: searchResultBloc.getCountSearchResult(),
              itemBuilder: (context, index) {
                final result = searchResultBloc.getSearchResult()[index];
                final routeResult = searchResultBloc.getRouteOfResult(result);
                return InkWell(
                  onTap: () {
                    NavigationRouteService.navigateTo(routeResult, context: context, pop: true);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(RoutesBodyService.getDataOf(routeResult).getTitle()),
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