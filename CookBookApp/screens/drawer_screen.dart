import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMV's Meals"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Categories'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/categories');
            },
          ),
           ListTile(
            leading: Icon(Icons.star),
            title: Text('Favourites'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/favorites' );
            },
          ),
          ListTile(
            leading: Icon(Icons.filter_list_alt),
            title: Text('Filters'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/filters');
            },
          ),
        ],
      ),
    );
  }
}
