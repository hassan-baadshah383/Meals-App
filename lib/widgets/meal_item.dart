import 'package:flutter/material.dart';

import '../models/meals_recipe.dart';
import 'meal_details.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String image;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.image,
    @required this.duration,
    @required this.title,
    @required this.complexity,
    @required this.affordability,
  });

  void mealDetail(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetails.route, arguments: id)
        .then((value) {
      if (value != null) {
        //removeMeal(value);
      }
    });
  }

  String get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
    }
    return null;
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mealDetail(context),
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    width: 300,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(getComplexity),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money_rounded),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(getAffordability),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
