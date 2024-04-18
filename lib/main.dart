
import 'package:flutter/material.dart';
import 'package:hesperidas/components/InputSearch.dart';
import 'package:hesperidas/post/RouteGenerator.dart';
import 'package:hesperidas/utils/NavigationRouteService.dart';
import 'components/BottonNavigationBar.dart';
import 'post/RouteGenerator.dart' as routeUtils;

void main () {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final NavigationRouteService _navigationService = NavigationRouteService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesperian - Rutas Dinámicas',
      initialRoute: '/', // Especifica la ruta inicial aquí
      home: MainScaffold(navigationService: _navigationService),
    );
  }
}

class MainScaffold extends StatelessWidget {
  final NavigationRouteService navigationService;

  const MainScaffold({super.key, required this.navigationService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(70.0), // Establece la altura de tu widget personalizado
          child: InputSearch(),// Tu widget personalizado
        ),
        title: const Text('Hesperian - Rutas Dinámicas'),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: routeUtils.routesApp.length,
          itemBuilder: (context, index) {
            String ruta = routeUtils.routesApp.keys.elementAt(index);
            var value = routeUtils.routesApp[ruta]!;
            return ListTile(
              leading: const Icon(Icons.person),
              title: Text(value['nombre']),
              onTap: () => NavigationRouteService.navigateTo(ruta, context),
            );
          },
        ),
      ),
      body: Navigator(
        key: NavigationRouteService.navigatorKey, //
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
      bottomNavigationBar: const ButtonNavigationBar());

  }
}





