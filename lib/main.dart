import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesperidas/blocs/GlobalStates.dart';
import 'package:hesperidas/components/InputSearch.dart';
import 'package:hesperidas/post/InfoRouteBody.dart';
import 'package:hesperidas/post/RoutesBodyService.dart';
import 'package:hesperidas/services/ManagerServices.dart';
import 'package:hesperidas/services/NavigationRouteService.dart';
import 'package:hesperidas/utils/Utils.dart';
import 'components/BottonNavigationBar.dart';

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
          title: 'Sobre ellas',
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
            appBar: AppBar(
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                // Establece la altura de tu widget personalizado
                child: InputSearch(),
              ),
              title: const Text('Sobre ellas'),
            ),
            drawer: Drawer(
              child: ListView.builder(
                itemCount: RoutesBodyService.getDataMenuArray().length,
                itemBuilder: (context, index) {
                  InfoRouteBody infoData =
                      RoutesBodyService.getDataMenuArray().elementAt(index);
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(infoData.getTitle()),
                    onTap: () => NavigationRouteService.navigateTo(infoData.getRoute(),
                        context: context, pop: true),
                  );
                },
              ),
            ),
            body: Navigator(
              initialRoute: RoutesBodyService.getIndexRoute(),
              key: NavigationRouteService.navigatorKey,
              onGenerateRoute: RoutesBodyService.generateRoute,
            ),
            bottomNavigationBar: const ButtonNavigationBar()));
  }
}
