import 'package:flutter/material.dart';
import 'package:meals_app/screens/drawer_screen.dart';
import '../models/filterData.dart';
class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
              padding: EdgeInsets.symmetric(vertical:0,horizontal:30),
            children: [
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text(
                  "Filter Options.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SwitchListTile(
                value: FilterData.glutenFree,
                title: Text('Gluten-free'),
                onChanged: (newValue) {
                  setState(
                    () {
                      FilterData.glutenFree = !FilterData.glutenFree;
                    },
                  );
                },
              ),
              SwitchListTile(
                value: FilterData.vegan,
                title: Text('Vegan'),
                onChanged: (newValue) {
                  setState(
                    () {
                      FilterData.vegan = !FilterData.vegan;
                    },
                  );
                },
              ),
              SwitchListTile(
                value: FilterData.vegetarian,
                title: Text('vegetarian'),
                onChanged: (newValue) {
                  setState(
                    () {
                      FilterData.vegetarian = !FilterData.vegetarian;
                    },
                  );
                },
              ),
              SwitchListTile(
                value: FilterData.lactoseFree,
                title: Text('Lactose-free'),
                onChanged: (newValue) {
                  setState(
                    () {
                      FilterData.lactoseFree = !FilterData.lactoseFree;
                    },
                  );
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
