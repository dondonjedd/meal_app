import 'package:flutter/material.dart';
import 'package:meal_app/widgets/filter_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, Icon icon, VoidCallback tapHandler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.primary,
            child: const Text(
              "Meal Application",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile("Food Categories", const Icon(Icons.restaurant), () {
            Navigator.of(context).pushNamed("/");
          }),
          buildListTile("Filter", const Icon(Icons.filter), () {
            Navigator.of(context).pushNamed(FilterPage.routeName);
          }),
        ],
      ),
    );
  }
}
