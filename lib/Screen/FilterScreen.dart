import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/main_Drawer.dart';

class FiltersScreen extends StatefulWidget {
  final saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: (() {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                }),
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const Drawer(
          child: MainDrawer(),
        ),
        body: Container(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: const Text('Gluten-free'),
                    value: _glutenFree,
                    onChanged: (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Lactose-free'),
                    value: _lactoseFree,
                    onChanged: (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Vegetarian'),
                    value: _vegetarian,
                    onChanged: (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Vegan'),
                    value: _vegan,
                    onChanged: (value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
