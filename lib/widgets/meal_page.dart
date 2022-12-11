import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealPage extends StatelessWidget {
  const MealPage({super.key});

  static const routeName = "/meal-page";
  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildSectionList(BuildContext context, List<String> list) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      height: 150,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 2,
            color: Theme.of(context).colorScheme.inversePrimary,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text("${index + 1}.\t\t\t ${list[index]}"),
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(meal.imageUrl,
                    height: 250, width: double.infinity, fit: BoxFit.cover),
              ),
              buildSectionTitle(context, "Ingredients"),
              buildSectionList(context, meal.ingredients),
              const Divider(),
              buildSectionTitle(context, "Steps"),
              buildSectionList(context, meal.steps),
            ],
          ),
        ),
      ),
    );
  }
}
