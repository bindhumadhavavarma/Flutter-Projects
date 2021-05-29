import 'package:flutter/material.dart';
import '../screens/drawer_screen.dart';
import '../dummy_data.dart';
import '../widgets/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMV Meals - Categories"),
      ),
      drawer: Drawer(child: DrawerScreen()),
      body: GridView(
        padding:const EdgeInsets.all(15),
        children: DUMMY_categoryIds
            .map((catData) => CategoriesItem(catData.id,catData.title, catData.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //width of each grid item
          childAspectRatio: 3 / 2, //height to width ratio
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
