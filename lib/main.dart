import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import './screens/categories_meal.dart';
import './widgets/meal_details.dart';
import './screens/filters.dart';
import './models/dummy_data.dart';
import './models/meals_recipe.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false
  };
  List<Meal> finalMeals = DUMMY_MEALS;
  List<Meal> favouriteList = [];

  void setFavourites(mealId) {
    final index = favouriteList.indexWhere((meal) => meal.id == mealId);
    if (index < 0) {
      setState(() {
        favouriteList.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    } else {
      setState(() {
        favouriteList.removeAt(index);
      });
    }
  }

  bool isFavourite(String mealId) {
    return favouriteList.any((meal) => meal.id == mealId);
  }

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      finalMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
          primaryColor: Colors.black,
          canvasColor: const Color.fromARGB(255, 158, 207, 198),
          fontFamily: 'Raleway',
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: TextStyle(
                  fontFamily: 'RobotoCondense',
                  fontSize: 18,
                  fontWeight: FontWeight.bold))),
      //home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(favouriteList),
        CategoriesMeals.nameRoute: (context) => CategoriesMeals(finalMeals),
        MealDetails.route: (context) => MealDetails(isFavourite, setFavourites),
        Filters.routeName: (context) => Filters(filters, setFilters),
      },
    );
  }
}
