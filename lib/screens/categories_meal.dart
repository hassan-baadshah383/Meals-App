import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meals_recipe.dart';

class CategoriesMeals extends StatefulWidget {
  static const nameRoute = '/categories_meal';
  final List<Meal> finalMeals;

  CategoriesMeals(this.finalMeals);

  @override
  State<CategoriesMeals> createState() => _CategoriesMealsState();
}

class _CategoriesMealsState extends State<CategoriesMeals> {
  String routeTitle;
  List<Meal> displayedMeal;
  @override
  void didChangeDependencies() {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    routeTitle = routesArgs['title'];
    final routeId = routesArgs['id'];
    displayedMeal = widget.finalMeals.where((meal) {
      return meal.categories.contains(routeId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            routeTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealItem(
              id: displayedMeal[index].id,
              image: displayedMeal[index].imageUrl,
              title: displayedMeal[index].title,
              duration: displayedMeal[index].duration,
              complexity: displayedMeal[index].complexity,
              affordability: displayedMeal[index].affordability,
            );
          }),
          itemCount: displayedMeal.length,
        ));
  }
}
