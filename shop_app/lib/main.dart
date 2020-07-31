import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screen/edit_product_screen.dart';

import './screen/order_screen.dart';
import './screen/cart_screen.dart';
import './screen/product_overview_screen.dart';
import './screen/product_detail.dart';
import './screen/user_produts_screen.dart';

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
        initialRoute: ProductsOverviewScreen.routeName,
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
