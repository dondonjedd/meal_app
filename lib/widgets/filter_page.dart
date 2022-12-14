import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterPage extends StatefulWidget {
  static const routeName = "/filters";
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool _isGlutenFree = false;
   bool _isVegan = false;
   bool _isVegetarian = false;
   bool _isLactoseFree = false;

  Widget builSwitchListTile(Widget title, Widget subtitle, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
        title: title,
        subtitle: subtitle,
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          title: const Text("Filters"),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
            ),
            Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(
                child: ListView(
              children: [
                builSwitchListTile(
                    const Text("Gluten Free"),
                    const Text("Only show gluten free meals"),
                    _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),

                builSwitchListTile(
                    const Text("Vegan"),
                    const Text("Only show vegan meals"),
                    _isVegan, (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),

                builSwitchListTile(
                    const Text("Vegetarian"),
                    const Text("Only show vegetarian meals"),
                    _isVegetarian, (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),

                builSwitchListTile(
                    const Text("Lactose Free"),
                    const Text("Only show lactose free meals"),
                    _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
