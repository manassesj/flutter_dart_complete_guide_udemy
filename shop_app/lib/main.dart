import 'package:flutter/material.dart';

import './screen/product_overview_screen.dart';
import './screen/product_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: buildThemeData(),
      initialRoute: ProductsOverviewScreen.routeName,
      routes: routes(),
    );
  }

  Map<String, WidgetBuilder> routes() {
    return {
      ProductsOverviewScreen.routeName: (_) => ProductsOverviewScreen(),
      ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
    };
  }

  ThemeData buildThemeData() {
    return ThemeData(
      primarySwatch: Colors.purple,
      accentColor: Colors.deepOrange,
      fontFamily: 'Lato',
    );
  }
}
