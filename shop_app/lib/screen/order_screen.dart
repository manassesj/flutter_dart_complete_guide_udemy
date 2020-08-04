import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screen/product_overview_screen.dart';
import 'package:shop_app/widgets/order_item.dart';

import '../providers/orders.dart';

class OrderScrren extends StatefulWidget {
  static const routeName = '/Order-screen';

  @override
  _OrderScrrenState createState() => _OrderScrrenState();
}

class _OrderScrrenState extends State<OrderScrren> {
  // var _init = true;
  // var _isLoading = false;
  // final scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void didChangeDependencies() {
  //   if (_init) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<Orders>(context, listen: false).fetchAndSetOrders().then(
  //           (_) => {
  //             setState(() {
  //               _isLoading = false;
  //             })
  //           },
  //         );
  //   }
  //   setState(() {
  //     _init = false;
  //   });

  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // final orders = Provider.of<Orders>(context).getOrders;

    return Scaffold(
      // key: scaffoldKey,
      appBar: AppBar(
        title: Text('Your Orders'),
        leading: GestureDetector(
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context)
                .popAndPushNamed(ProductsOverviewScreen.routeName),
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (_, datasnackShot) {
          if (datasnackShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (datasnackShot.error != null) {
              return Center(
                child: Text(
                  'A erro Ocurrred',
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              return Consumer<Orders>(
                builder: (_, orders, child) => ListView.builder(
                  itemCount: orders.getOrders.length,
                  itemBuilder: (_, index) =>
                      OrderItemWidget(order: orders.getOrders[index]),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
