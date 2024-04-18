import 'package:flutter/material.dart';
import 'posts/PostType1.dart';


Map<String, dynamic> routesApp = {
  '/': {
    'nombre': 'Entrada Principal'
  },
  '/settings': {
    'nombre': 'Ajustes de Aplicación'
  },
  '/profile': {
    'nombre': 'Información de Perfil'
  },
  '/debug': {
    'nombre': 'Zona de Debug'
  },
  '/post1': {
    'nombre': 'Publicación: Post 1'
  },
  '/post2': {
    'nombre': 'Publicación: Post 2'
  },
  '/post3': {
    'nombre': 'Publicación: Post 3'
  },
  '/post4': {
    'nombre': 'Publicación: Post 4'
  },
};


//Mockup Clase
// Falta refactorizar esto para hacer los Post con sus rutas de manera más declarativa
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var route = settings.name.toString();
    var nombre = routesApp[route]['nombre'];


    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Container(
        color: Colors.white,  // Aplica el color de fondo
        child: PostType1(cardName: nombre),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0); // Comienza la transición desde la derecha
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300), // Duración de la transición
    );
    switch (route) {
      case '/':
        return MaterialPageRoute(builder: (_) => PostType1(cardName:nombre));
      case '/settings':
        return MaterialPageRoute(builder: (_) =>  PostType1(cardName:nombre));
      case '/profile':
        return MaterialPageRoute(builder: (_) =>  PostType1(cardName:nombre));
      default:
        throw FormatException("La ruta no fue encontrada");
    }
  }

  static getDataRouter(String route) {
    return routesApp[route];
  }
}


//Clase Real
/*class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var route = settings.name.toString();
    var nombre = routesApp[route]['nombre'];
    switch (route) {
      case '/':
        return MaterialPageRoute(builder: (_) => SampleCard(cardName:nombre));
      case '/settings':
        return MaterialPageRoute(builder: (_) =>  SampleCard(cardName:nombre));
      case '/profile':
        return MaterialPageRoute(builder: (_) =>  SampleCard(cardName:nombre));
      default:
        throw FormatException("La ruta no fue encontrada");
    }
  }
}*/