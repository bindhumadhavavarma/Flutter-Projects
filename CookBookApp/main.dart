import 'package:flutter/material.dart';
import './screens/favourites_screen.dart';
import './screens/filters_screen.dart';
import './screens/catogeries_screen.dart';
import './screens/meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMV Meals',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigo,
        canvasColor: Colors.indigo[50],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      home: CategoriesScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/mealsScreen': (_) => MealsScreen(),
        '/categories': (_) => CategoriesScreen(),
        '/favorites': (_) => FavouritesScreen(),
        '/filters': (_) => FiltersScreen(),
      },
    );
  }
}
