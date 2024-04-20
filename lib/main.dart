import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/blocs/GlobalStates.dart';
import 'package:hesperidas/components/InputSearch.dart';
import 'package:hesperidas/post/BodyRouteView.dart';
import 'package:hesperidas/post/RoutesBodyService.dart';
import 'package:hesperidas/services/ManagerServices.dart';
import 'package:hesperidas/services/NavigationRouteService.dart';
import 'components/BottonNavigationBar.dart';

Future<void> main() async {
  await ManagerServices.initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NavigationRouteService _navigationService = NavigationRouteService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: GlobalStates.getStatesBlocks(),
        child: const MaterialApp(
          title: 'Hesperian - Rutas Dinámicas',
          home: MainScaffold(),
        ));
  }
}

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            // Establece la altura de tu widget personalizado
            child: InputSearch(),
          ),
          title: const Text('Hesperian - Rutas Dinámicas'),
        ),
        drawer: Drawer(
          child: ListView.builder(
            itemCount: RoutesBodyService.getMenuRoutesArray().length,
            itemBuilder: (context, index) {
              String ruta =
                  RoutesBodyService.getMenuRoutesArray().elementAt(index);
              BodyRouteView value = RoutesBodyService.getDataOf(ruta);
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(value.getTitle()),
                onTap: () => NavigationRouteService.navigateTo(ruta, context: context, pop: true),
              );
            },
          ),
        ),
        body: Navigator(
          initialRoute: RoutesBodyService.getIndexRoute(),
          key: NavigationRouteService.navigatorKey,
          onGenerateRoute: RoutesBodyService.generateRoute,
        ),
        bottomNavigationBar: const ButtonNavigationBar());
  }
}
