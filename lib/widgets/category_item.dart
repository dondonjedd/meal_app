import 'package:flutter/material.dart';
import 'package:meal_app/models/food_category.dart';

import '../dummy_data.dart';
import 'category_page.dart';

class CategoryItem extends StatelessWidget {
  final FoodCategory foodCategory;

  const CategoryItem(this.foodCategory, {super.key});

  void openCategoryPage(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(CategoryPage.routeName, arguments: foodCategory);

    // for simple apps
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return CategoryPage(foodCategory);
    // }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openCategoryPage(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
                (DUMMY_MEALS.firstWhere(
                    (el) => el.categories.contains(foodCategory.id))).imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  foodCategory.color.withOpacity(0.4),
                  foodCategory.color,
                ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              foodCategory.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        ],
      ),
    );
  }
}
