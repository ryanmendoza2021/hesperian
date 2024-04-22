import 'package:flutter/material.dart';
import 'ToggleFavorites.dart';

class LayoutPost extends StatelessWidget {
  final String route;
  final String? title;
  final bool isPost;
  final List<Widget> children;

  const LayoutPost(
      {super.key,
      required this.route,
      this.title,
      required this.isPost,
      required this.children});

  final TextStyle textStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 32);

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenLayout = [
      Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 40, right: isPost ? 10 : 45),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Text(
              textAlign: TextAlign.center,
              title ?? '',
              style: textStyle,
            )),
            if (isPost && title != null)
              SizedBox(
                width: 80,
                child: ToggleFavorites(route: route),
              )
          ],
        ),
      )
    ];

    List<Widget> combinedChildren = childrenLayout + children;

    return SizedBox.expand(
      child: Container(
        color: Colors.white70,
        child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                children: title == null ? children : combinedChildren)),
      ),
    );
  }
}
