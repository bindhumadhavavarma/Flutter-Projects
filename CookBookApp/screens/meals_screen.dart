import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/filterData.dart';

class MealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String title = routeArgs['title'];
    final String id = routeArgs['id'];
    var categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categoryIds.contains(id);
    }).toList();
    if(FilterData.glutenFree){
      categoryMeals=categoryMeals.where((element) {
        return element.isGlutenFree;
        }).toList();
    }
    if(FilterData.vegetarian){
      categoryMeals=categoryMeals.where((element) {
        return element.isVegetarian;
        }).toList();
    }
    if(FilterData.vegan){
      categoryMeals=categoryMeals.where((element) {
        return element.isVegan;
        }).toList();
    }
    if(FilterData.lactoseFree){
      categoryMeals=categoryMeals.where((element) {
        return element.isLactoseFree;
        }).toList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Category - " + title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
