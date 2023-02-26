import 'package:all_recipes/screens/category_meal_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  late String id;
  late String title;
  late Color color;
  CategoryItem(this.id,this.title,this.color);
  void selectCategory(BuildContext ctx)
  {
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
       arguments: {
        'id': id,
        'title':title
      }
      );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19.0,
              letterSpacing: 1.0,
              fontFamily: 'PTSerif'
            ),
            ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
          colors:[color.withOpacity(0.7),color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}