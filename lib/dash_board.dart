import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'widgets/category_item.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES.map((cat) {
            return CategoryItem(cat.title, cat.color);
          }).toList(),
        ),
      ),
    );
  }
}
