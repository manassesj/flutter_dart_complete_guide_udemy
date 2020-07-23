import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryMealsScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Theme.of(context).canvasColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(categoryTitle),
      ),
    );
  }
}
