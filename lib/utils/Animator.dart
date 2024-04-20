import 'package:flutter/cupertino.dart';

class Animator {
  static Widget Function(
          BuildContext, Animation<double>, Animation<double>, Widget) deslizar =
      (context, animation, secondaryAnimation, child) {
    var begin = const Offset(1.0, 0.0);
    var end = Offset.zero;
    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  };
}
