import 'package:flutter/material.dart';
import '../Screen/FilterScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, Function tapHandler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          tapHandler();
        },
      );
    }

    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking Up!',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        const SizedBox(height: 20),
        buildListTile(
          'Meals',
          Icons.restaurant,
          () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        buildListTile(
          'Filters',
          Icons.settings,
          () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          },
        ),
      ],
    );
  }
}
