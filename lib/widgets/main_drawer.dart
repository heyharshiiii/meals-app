import 'package:all_recipes/screens/filters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height:120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Center(
            child: Text('What Up Chef!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'PTSerif',
              fontSize: 30.0
            )
            ,),
          ),

        ),
        SizedBox(height: 20.0,),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            size: 26,
            ),
            title: Text('All Meals',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              fontFamily: 'PTSerif'
            ),
            ),
            onTap: (){
                Navigator.of(context).pushReplacementNamed('/');
            },
            ),
            ListTile(
          leading: Icon(
            Icons.settings,
            size: 26,
            ),
            title: Text('Filters',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              fontFamily: 'PTSerif'
            ),
            ),
            onTap: (){
               Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
            ),
      ]),
    );
  }
}