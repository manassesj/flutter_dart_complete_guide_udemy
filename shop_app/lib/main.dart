import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import './screen/edit_product_screen.dart';
import './screen/auth_screen.dart';
import './screen/order_screen.dart';
import './screen/cart_screen.dart';
import './screen/product_overview_screen.dart';
import './screen/product_detail.dart';
import './screen/user_produts_screen.dart';

import './providers/auth.dart';
import './providers/orders.dart';
import './providers/cart.dart';
import './providers/products_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: buildThemeData(),
        initialRoute: AuthScreen.routeName,
        routes: routes(),
      ),
    );
  }

  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(
        create: (_) => Products(),
      ),
      ChangeNotifierProvider(
        create: (_) => Cart(),
      ),
      ChangeNotifierProvider(
        create: (_) => Orders(),
      ),
      ChangeNotifierProvider(
        create: (_) => Auth(),
      ),
    ];
  }

  Map<String, WidgetBuilder> routes() {
    return {
      ProductsOverviewScreen.routeName: (_) => ProductsOverviewScreen(),
      ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
      CartScreen.routeName: (_) => CartScreen(),
      OrderScrren.routeName: (_) => OrderScrren(),
      UserProductScreen.routeName: (_) => UserProductScreen(),
      EditProductScreen.routeName: (_) => EditProductScreen(),
      AuthScreen.routeName: (_) => AuthScreen(),
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
