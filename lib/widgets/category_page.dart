import 'package:flutter/material.dart';
import 'package:meal_app/models/food_category.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category-page";
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final foodCategory =
        ModalRoute.of(context)!.settings.arguments as FoodCategory;
    return Scaffold(
      appBar: AppBar(title: Text(foodCategory.title)),
      body: Center(
        child: Text(foodCategory.title),
      ),
    );
  }
}
