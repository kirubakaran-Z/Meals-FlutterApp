import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/Meal_item.dart';
// import '../models/Meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List availableMeals;

  const CategoryMealsScreen(this.availableMeals);
  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categorymeals = widget.availableMeals.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
        centerTitle: true,
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categorymeals[index].id,
              title: categorymeals[index].title,
              imageUrl: categorymeals[index].imageUrl,
              duration: categorymeals[index].duration,
              complexity: categorymeals[index].complexity,
              affordability: categorymeals[index].affordability);
        },
        itemCount: categorymeals.length,
      )),
    );
  }
}
