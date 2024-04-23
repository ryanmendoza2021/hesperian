import 'package:flutter/material.dart';
import 'package:hesperidas/utils/Utils.dart';

import '../utils/ThemeCustom.dart';
import 'InputSearch.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    required this.title,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 1000,
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: ThemeCustom.colorPrimary.withOpacity(0.9),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: InputSearch(),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => print("Settings button pressed"),
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeCustom.colorPrimaryV2,
            minimumSize: const Size(15, 15),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Icon(
              Icons.settings,
              color: ThemeCustom.colorWhite.withOpacity(0.9),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130); // Altura del AppBar
}
