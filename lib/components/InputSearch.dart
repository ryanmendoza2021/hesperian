import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchResultBloc =
        BlocProvider.of<SearchResultBloc>(context, listen: false);
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      onChanged: (text) {
        searchResultBloc.searchPost(text);
        NavigationRouteService.navigateToView(const SearchPostView(),
            replacement: false);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _focusNode.requestFocus();
        });
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _controller.clear();
            _focusNode.unfocus();
            if (NavigationRouteService.isCurrentRoute(const SearchPostView())) {
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
