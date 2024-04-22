import 'package:flutter/material.dart';

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
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.purple,
      bottom: bottom,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => print("Settings button pressed"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purpleAccent,
            minimumSize: const Size(15, 15),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(7),
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom != null
      ? 60 + bottom!.preferredSize.height
      : 60); // Altura del AppBar
}
