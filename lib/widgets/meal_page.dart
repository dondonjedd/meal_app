import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealPage extends StatelessWidget {
  const MealPage({super.key});

  static const routeName = "/meal-page";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: const Text("data"));
  }
}
