import 'package:flutter/material.dart';
import 'package:meals_app/models/meals_recipe.dart';

import 'categories_Screen.dart';
import '../widgets/drawer.dart';
import 'favourites.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteList;

  TabsScreen(this.favouriteList);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;
  @override
  void initState() {
    pages = [
      {'page': CategoriesScreen(), 'title': 'Meals App'},
      {'page': Favourites(widget.favouriteList), 'title': 'Favourites'}
    ];
    super.initState();
  }

  int initialPage = 0;
  void selectPage(int page) {
    setState(() {
      initialPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              (pages[initialPage]['title'] as String),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black),
        drawer: DrawerPage(),
        body: (pages[initialPage]['page'] as Widget),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: initialPage,
          onTap: selectPage,
          backgroundColor: Colors.black,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourites')
          ],
        ));
  }
}
