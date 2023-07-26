import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const route = '/meal_details';
  final Function setFavourite;
  final Function isFavourite;

  MealDetails(this.isFavourite, this.setFavourite);

  Widget name(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget container(Widget child, double h, double b, Color color) {
    return SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(top: 10, bottom: b),
            height: h,
            width: 300,
            child: child));
  }

  @override
  Widget build(BuildContext context) {
    final routeId = ModalRoute.of(context).settings.arguments as String;
    final meals = DUMMY_MEALS.firstWhere((element) => element.id == routeId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(meals.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                meals.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            name(context, 'Ingredients'),
            container(
                ListView.builder(
                  itemBuilder: ((context, index) {
                    return Card(
                      color: const Color.fromARGB(255, 207, 148, 126),
                      child: Text(
                        meals.ingredients[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }),
                  itemCount: meals.ingredients.length,
                ),
                100,
                0,
                Colors.brown),
            name(context, 'Steps'),
            container(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 207, 148, 126),
                              child: Text(
                                '#${index + 1}',
                              ),
                            ),
                            title: Text(
                              meals.steps[index],
                              style: const TextStyle(
                                  color: Colors.white, fontFamily: 'Raleway'),
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                  itemCount: meals.steps.length,
                ),
                200,
                20,
                Colors.brown)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 77, 101, 137),
        child: Icon(isFavourite(routeId) ? Icons.star : Icons.star_border),
        onPressed: () {
          setFavourite(routeId);
        },
      ),
    );
  }
}
