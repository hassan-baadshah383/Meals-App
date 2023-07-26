import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  Map<String, bool> filters;

  Filters(this.filters, this.setFilters);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  @override
  void initState() {
    isGlutenFree = widget.filters['gluten'];
    isVegan = widget.filters['vegan'];
    isVegetarian = widget.filters['vegetarian'];
    isLactoseFree = widget.filters['lactose'];
    super.initState();
  }

  Widget buildSwitchTile(
      String title, String subtitle, bool currentValue, updateValue) {
    return SwitchListTile(
      activeColor: Colors.black,
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Filters',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': isGlutenFree,
                  'vegan': isVegan,
                  'vegetarian': isVegetarian,
                  'lactose': isLactoseFree,
                };
                widget.setFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: DrawerPage(),
        body: Column(
          children: [
            Container(
              height: 80,
              padding: const EdgeInsets.all(30),
              child: const Text(
                'Your filters here!',
                style: TextStyle(
                    wordSpacing: 4,
                    fontSize: 22,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              ),
            ),
            buildSwitchTile(
                'Gulten-Free', 'The foods which are gluten free', isGlutenFree,
                (newValue) {
              setState(() {
                isGlutenFree = newValue;
              });
            }),
            buildSwitchTile('Vegan', 'The Vegan food', isVegan, (newValue) {
              setState(() {
                isVegan = newValue;
              });
            }),
            buildSwitchTile('Vegetarian', 'The Vegetable food', isVegetarian,
                (newValue) {
              setState(() {
                isVegetarian = newValue;
              });
            }),
            buildSwitchTile('Lactose-Free', 'The foods which are lactose free',
                isLactoseFree, (newValue) {
              setState(() {
                isLactoseFree = newValue;
              });
            }),
          ],
        ));
  }
}
