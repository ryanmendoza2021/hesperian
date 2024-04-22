import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/blocs/GlobalStates.dart';
import 'package:hesperidas/components/DrawerCustom.dart';
import 'package:hesperidas/post/RoutesBodyService.dart';
import 'package:hesperidas/services/ManagerServices.dart';
import 'package:hesperidas/services/NavigationRouteService.dart';
import 'components/BottonNavigationBar.dart';
import 'components/CustomAppBar.dart';

const String appName = 'Sobre Ellas';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ManagerServices.initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: GlobalStates.getStatesBlocks(),
        child: const MaterialApp(
          title: appName,
          home: MainScaffold(),
        ));
  }
}

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: const CustomAppBar(
              title: appName,
            ),
            drawer: const DrawerCustom(),
            body: Navigator(
              initialRoute: RoutesBodyService.getIndexRoute(),
              key: NavigationRouteService.navigatorKey,
              onGenerateRoute: RoutesBodyService.generateRoute,
            ),
            bottomNavigationBar: const ButtonNavigationBar()));
  }
}
