import 'package:flutter/material.dart';
import 'package:meal_app/models/food_category.dart';
import 'package:meal_app/widgets/meal_for_a_category/meal_item.dart';

import '../../models/meal.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category-page";
  List<Meal> availableMeals;
  CategoryPage(this.availableMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    final foodCategory =
        ModalRoute.of(context)!.settings.arguments as FoodCategory;

    final categoryMeals = availableMeals.where((element) {
      return element.categories.contains(foodCategory.id);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text(foodCategory.title)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(meal: categoryMeals[index]);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
