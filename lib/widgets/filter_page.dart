import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterPage extends StatelessWidget {
  static const routeName = "/filters";
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          title: const Text("Filters"),
        ),
        body: const Center(child: Text("filter Page")));
  }
}
