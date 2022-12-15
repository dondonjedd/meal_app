import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/filter_page.dart';
import 'package:meal_app/widgets/meal_page.dart';
import 'package:meal_app/widgets/tabs_screen.dart';
import 'dash_board.dart';
import 'widgets/category_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters["gluten"]!) {
          return false;
        }
        if (!meal.isLactoseFree && _filters["lactose"]!) {
          return false;
        }
        if (!meal.isVegan && _filters["vegan"]!) {
          return false;
        }
        if (!meal.isVegetarian && _filters["vegetarian"]!) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            accentColor: Colors.brown,
          ),
          fontFamily: "RobotoCondensed",
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodySmall:
                  const TextStyle(color: Color.fromARGB(255, 65, 21, 93)),
              titleLarge: const TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold))),
      routes: {
        "/": (ctx) => const TabsScreen(),
        CategoryPage.routeName: (ctx) => CategoryPage(availableMeals),
        MealPage.routeName: (ctx) => const MealPage(),
        FilterPage.routeName: (ctx) => FilterPage(_setFilters, _filters)
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => const Dashboard());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const Dashboard());
      },
    );
  }
}
