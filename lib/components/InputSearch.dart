import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/blocs/SearchActive.dart';
import 'package:hesperidas/views/SearchPostView.dart';

import '../blocs/SearchResultBloc.dart';
import '../services/NavigationRouteService.dart';

class InputSearch extends StatefulWidget {
  const InputSearch({super.key});

  @override
  InputSearchState createState() => InputSearchState();
}

class InputSearchState extends State<InputSearch> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late StreamSubscription<bool> _subscription;

  void clearInputSearch() {
    _controller.clear();
    _focusNode.unfocus();
  }

  @override
  void initState() {
    super.initState();


    _subscription = BlocProvider.of<SearchActive>(context)
        .stream
        .listen((activeSearchState) {
      if (!activeSearchState) {
        clearInputSearch();
      } else {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchResultBloc =
        BlocProvider.of<SearchResultBloc>(context, listen: false);
    final searchActiveRead =
        BlocProvider.of<SearchActive>(context, listen: false);

    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      onChanged: (text) {
        searchResultBloc.searchPost(text);
        NavigationRouteService.navigateToView(const SearchPostView(),
            replacement: false);
        searchActiveRead.setSateSearch(true);
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _focusNode.requestFocus();
        });
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            searchActiveRead.setSateSearch(false);
            if (NavigationRouteService.isCurrentRouteOfType(SearchPostView)) {
              NavigationRouteService.goBack();
            }
          },
        ),
        labelText: 'Búsqueda',
        hintText: 'Artículos, post, secciones, etc',
        filled: true,
      ),
    );
  }
}
