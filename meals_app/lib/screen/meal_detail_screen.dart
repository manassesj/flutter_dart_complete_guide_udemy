import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealTitle = routeArguments['mealTitle'];
    final mealId = routeArguments['mealId'];

    final selectMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            mealTitle,
            style: TextStyle(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300.0,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            buildTitle(context, 'Ingredients'),
            buildContainer(
              context,
              ListView.builder(
                itemCount: selectMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: Text(
                        selectMeal.ingredients[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            buildTitle(context, 'Steps'),
            buildContainer(
              context,
              ListView.builder(
                itemCount: selectMeal.steps.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(
                          selectMeal.steps[index],
                          softWrap: true,
                        ),
                      ),
                      Divider(
                        height: 2.0,
                        color: Colors.black,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      height: 200.0,
      width: 300.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}
