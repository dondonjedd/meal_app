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
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(meal.imageUrl,
                  height: 250, width: double.infinity, fit: BoxFit.cover),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                          "${index + 1}.\t\t\t ${meal.ingredients[index]}"),
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
