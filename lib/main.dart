import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_page.dart';
import 'dash_board.dart';
import 'widgets/category_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meal App',
        theme: ThemeData(
            primarySwatch: Colors.green,
            fontFamily: "RobotoCondensed",
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyMedium:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodySmall:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                titleLarge: const TextStyle(
                    fontSize: 20,
                    fontFamily: "RobotoCondensed",
                    fontWeight: FontWeight.bold))),
        routes: {
          "/": (ctx) => const Dashboard(),
          CategoryPage.routeName: (ctx) => const CategoryPage(),
          MealPage.routeName: (ctx) => const MealPage(),
        });
  }
}
