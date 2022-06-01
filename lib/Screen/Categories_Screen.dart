import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../Widgets/Category_item.dart';

class CatogoryScreen extends StatelessWidget {
  const CatogoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((catogory) {
        return CategoryItem(catogory.id, catogory.title, catogory.color);
      }).toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
