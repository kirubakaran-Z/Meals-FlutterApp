import 'package:flutter/material.dart';

import 'Categories_Screen.dart';
import 'favirouit_Screen.dart';
import '../Widgets/main_Drawer.dart';
import '../Models/Meal.dart';

class TabScreen extends StatefulWidget {
  List<Meal> _favoriteMeals = [];

  TabScreen(this._favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;
  _selectPages(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': const CatogoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget._favoriteMeals),
        'title': 'Favorites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
        centerTitle: true,
      ),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPages,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
