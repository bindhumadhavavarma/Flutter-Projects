import 'package:flutter/material.dart';
import '../models/filterData.dart';
class MealDetailsScreen extends StatefulWidget {
  final mealDetails;
  MealDetailsScreen(this.mealDetails);

  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  void toggleFavourite(){
    setState(() {
      if(FilterData.favouteIds.contains(widget.mealDetails.id)){
      FilterData.favouteIds.remove(widget.mealDetails.id);
    }
    else{
      FilterData.favouteIds.add(widget.mealDetails.id);
    }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealDetails.title),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                widget.mealDetails.imageUrl,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Colors.purple.withOpacity(0.7),
                  Colors.red,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < widget.mealDetails.ingredients.length; i++)
                  Text(
                    '${(i + 1).toString()}) ${widget.mealDetails.ingredients[i].toString()}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Steps',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Colors.lightGreen.withOpacity(0.7),
                  Colors.orange,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < widget.mealDetails.steps.length; i++)
                  Text(
                    '${(i + 1).toString()}) ${widget.mealDetails.steps[i].toString()}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FilterData.favouteIds.contains(widget.mealDetails.id)?Icons.star:Icons.star_border),
        onPressed: toggleFavourite,
      ),
    );
  }
}
