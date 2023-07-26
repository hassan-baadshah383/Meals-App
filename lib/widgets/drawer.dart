import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      backgroundColor: Colors.black,
      child: DrawerHeader(
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25)),
              //color: Colors.orange,
              height: 50,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 60),
              child: const Text('Cooking Up!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            ListTile(
              leading: const Icon(
                Icons.restaurant,
                color: Colors.grey,
              ),
              title: const Text(
                'Meals',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              title: const Text(
                'Filters',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/filters');
              },
            )
          ],
        ),
      ),
    );
  }
}
