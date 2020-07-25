import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealTitle = routeArguments['mealTitle'];
    final mealId = routeArguments['mealId'];

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text(mealTitle, style: TextStyle(),)),
      ),
      body: Center(
        child: Text(
          mealId,
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
