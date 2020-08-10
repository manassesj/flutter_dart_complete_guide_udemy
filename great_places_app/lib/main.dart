import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import './providers/great_places.dart';

import './screens/places_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: buildThemeData(),
        home: PlaceListScreen(),
        routes: routes(),
      ),
    );
  }

  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(
        create: (_) => GreatPlacesProvider(),
      ),
    ];
  }

  Map<String, WidgetBuilder> routes() {
    return {
      PlaceListScreen.routeName: (_) => PlaceListScreen(),
    };
  }

  ThemeData buildThemeData() => ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
      );
}
