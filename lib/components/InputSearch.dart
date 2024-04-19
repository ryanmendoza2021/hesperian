import 'package:flutter/material.dart';

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
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon:  IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _controller.clear();
            _focusNode.unfocus();
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ),
        labelText: 'Búsqueda',
        hintText: 'Artículos, post, secciones, etc',
        filled: true,
      ),
    );
  }
}