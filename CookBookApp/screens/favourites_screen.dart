import 'package:flutter/material.dart';
import 'package:meals_app/screens/drawer_screen.dart';
import '../models/filterData.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    bool isfavourite(meal) {
      for (var i in FilterData.favouteIds) {
        if (i == meal.id) return true;
      }
      return false;
    }

    var categoryMeals;
    setState(() {categoryMeals= DUMMY_MEALS.where((meal) {
      return isfavourite(meal);
    }).toList();});

    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      body: FilterData.favouteIds.length != 0
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(categoryMeals[index]);
              },
              itemCount: categoryMeals.length,
            )
          : Center(
              child: Text('You dont have any fanoutes.Add some to view here.'),
            ),
    );
  }
}
