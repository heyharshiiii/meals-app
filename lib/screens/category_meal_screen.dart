import 'package:all_recipes/models/category.dart';
import 'package:all_recipes/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../models/meals.dart';
class CategoryMealScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealScreen(this.categoryId,this.categoryTitle);
  static const routeName='/category-meals';
  final List<Meal>availableMeals;
  CategoryMealScreen(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    
    final routeArgs=ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final categoryTitle=routeArgs['title'];
    final categoryId=routeArgs['id'];
    final categoryMeals=DUMMY_MEALS.where((meal)
    {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: 
      Text(categoryTitle!
      , 
      style: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        fontSize: 25.0,
        fontFamily: 'IndieFlower'
      ),),
      centerTitle: true,
      ),
      body:ListView.builder(
        itemBuilder: ((context, index)
        {
          return MealItem(id: categoryMeals[index].id,
            title: categoryMeals[index].title,
           imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
             complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability
              );
        }),
        itemCount: categoryMeals.length,
        )
    );
  }
}