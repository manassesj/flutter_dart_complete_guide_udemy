import 'package:flutter/material.dart';

import '../screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          buildListTile(
            icon: Icons.restaurant,
            title: 'Meals',
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          Divider(
            height: 4.0,
            color: Colors.black,
            indent: 10.0,
            endIndent: 10.0,
          ),
          buildListTile(
            icon: Icons.settings,
            title: 'Filters',
            onTap: () {
              Navigator.pushNamed(context, FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  ListTile buildListTile({IconData icon, String title, Function onTap}) {
    return ListTile(
      leading: Icon(icon, size: 26.0),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
