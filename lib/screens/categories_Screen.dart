import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

import '../models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
      children: DUMMY_CATEGORIES
          .map((item) => CategoryItem(item.id, item.title, item.color))
          .toList(),
    );
  }
}
