import 'package:flutter/material.dart';
class CategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color tile_color;
  CategoriesItem(this.id, this.title, this.tile_color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/mealsScreen',
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              tile_color.withOpacity(0.7),
              tile_color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
