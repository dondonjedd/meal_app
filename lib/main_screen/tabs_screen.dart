import 'package:flutter/material.dart';
import 'package:meal_app/main_screen/dash_board.dart';


import 'favorites_page.dart';
import 'main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = const [
    {"page": Dashboard(), "title": "Categories"},
    {"page": FavoritesPage(), "title": "Favorites"},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      appBar:
          AppBar(title: Text(_pages[_selectedPageIndex]["title"] as String)),
      body: _pages[_selectedPageIndex]["page"] as Widget,
      // bottomNavigationBar: BottomNavigationBar(
      //     onTap: _selectPage,
      //     backgroundColor: Theme.of(context).colorScheme.primary,
      //     unselectedItemColor: Colors.cyan,
      //     selectedItemColor: Colors.white,
      //     currentIndex: _selectedPageIndex,
      //     type: BottomNavigationBarType.fixed,
      //     items: const [
      //       BottomNavigationBarItem(
      //           // backgroundColor: Theme.of(context).colorScheme.primary,
      //           icon: Icon(
      //             Icons.category_rounded,
      //           ),
      //           label: "Categories"),
      //       BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
      //     ]),
    );
    // DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: const Text("Meals"),
    //         bottom: const TabBar(tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: "Categories",
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: "Favorites",
    //           ),
    //         ]),
    //       ),
    //       body: const TabBarView(children: [Dashboard(), FavoritesPage()]),
    //     ));
  }
}
