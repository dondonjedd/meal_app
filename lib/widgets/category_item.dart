import 'package:flutter/material.dart';

import 'category_page.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem(this.title, this.color, {super.key});

  void openCategoryPage(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return const CategoryPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openCategoryPage(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color.withOpacity(0.7),
              color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
