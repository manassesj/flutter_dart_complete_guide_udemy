import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  final Function setFilters;
  final Map<String, bool> filters;

  FiltersScreen({this.setFilters, this.filters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.filters['gluten;'];
    _vegetarian = widget.filters['vegetarian;'];
    _vegan = widget.filters['vegan;'];
    _lactoseFree = widget.filters['lactose;'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.setFilters({
                'gluten': _glutenFree,
                'lactose': _vegetarian,
                'vegan': _vegan,
                'vegetarian': _lactoseFree,
              });
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              buildSwitchListTile(
                title: 'Vegan-free',
                value: _vegan,
                onChanged: (value) {
                  setState(() {
                    _vegan = value;
                  });
                },
              ),
              Divider(
                height: 2,
                color: Theme.of(context).primaryColor,
                indent: 7.0,
                endIndent: 7.0,
              ),
              buildSwitchListTile(
                title: 'Vegetarian-free',
                value: _vegetarian,
                onChanged: (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                },
              ),
              Divider(
                height: 2,
                color: Theme.of(context).primaryColor,
                indent: 7.0,
                endIndent: 7.0,
              ),
              buildSwitchListTile(
                title: 'Gluten-free',
                value: _glutenFree,
                onChanged: (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                },
              ),
              Divider(
                height: 2,
                color: Theme.of(context).primaryColor,
                indent: 7.0,
                endIndent: 7.0,
              ),
              buildSwitchListTile(
                title: 'Lactose-free',
                value: _lactoseFree,
                onChanged: (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                },
              ),
              Divider(
                height: 2,
                color: Theme.of(context).primaryColor,
                indent: 7.0,
                endIndent: 7.0,
              ),
            ],
          ))
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      {String title, bool value, Function onChanged}) {
    return SwitchListTile(
      activeColor: Theme.of(context).primaryColor,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
