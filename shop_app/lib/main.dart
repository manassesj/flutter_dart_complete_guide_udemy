import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/helpers/cursom_route.dart';

import './screen/splash_screen.dart';
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
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop App',
          theme: buildThemeData(),
          home: auth.isAuth
              ? ProductsOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (contex, snapShot) =>
                      snapShot.connectionState == ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: routes(),
        ),
      ),
    );
  }

  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(
        create: (_) => Auth(),
      ),
      ChangeNotifierProxyProvider<Auth, Products>(
        update: (_, auth, previusProducts) => Products(
          auth.token,
          previusProducts == null ? [] : previusProducts.getItems,
          auth.userId,
        ),
      ),
      ChangeNotifierProxyProvider<Auth, Orders>(
        update: (_, auth, previusOrders) => Orders(auth.token,
            previusOrders == null ? [] : previusOrders.getOrders, auth.userId),
      ),
      ChangeNotifierProvider(
        create: (_) => Cart(),
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
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: customPageTransitionBuilder(),

      })
    );
  }
}
