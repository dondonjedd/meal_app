import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/food_category.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category-page";
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final foodCategory =
        ModalRoute.of(context)!.settings.arguments as FoodCategory;

    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(foodCategory.id);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text(foodCategory.title)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Text(categoryMeals[index].title);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
