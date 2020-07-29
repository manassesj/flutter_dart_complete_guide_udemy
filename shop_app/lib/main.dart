import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screen/cart_screen.dart';
import './screen/product_overview_screen.dart';
import './screen/product_detail.dart';

import './providers/cart.dart';
import './providers/products_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: buildThemeData(),
        initialRoute: ProductsOverviewScreen.routeName,
        routes: routes(),
      ),
    );
  }

  Map<String, WidgetBuilder> routes() {
    return {
      ProductsOverviewScreen.routeName: (_) => ProductsOverviewScreen(),
      ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
      CartScreen.routeName: (_) => CartScreen(),
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
