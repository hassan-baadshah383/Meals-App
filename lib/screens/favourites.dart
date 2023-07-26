import 'package:flutter/material.dart';

import '../models/meals_recipe.dart';
import '../widgets/meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favouriteList;

  Favourites(this.favouriteList);

  @override
  Widget build(BuildContext context) {
    if (favouriteList.isEmpty) {
      return const Center(
        child: Text('No any of your favourite - Try adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: favouriteList[index].id,
            image: favouriteList[index].imageUrl,
            title: favouriteList[index].title,
            duration: favouriteList[index].duration,
            complexity: favouriteList[index].complexity,
            affordability: favouriteList[index].affordability,
          );
        }),
        itemCount: favouriteList.length,
      );
    }
  }
}
