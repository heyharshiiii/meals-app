import 'package:all_recipes/models/dummy_data.dart';
import 'package:all_recipes/screens/categories_screen.dart';
import 'package:all_recipes/screens/category_meal_screen.dart';
import 'package:all_recipes/screens/filters_screen.dart';
import 'package:all_recipes/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './screens/tabs_screen.dart';
import 'models/meals.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> _availableMeals=DUMMY_MEALS;
  void _setFilters(Map<String,bool> filterData)
  {
    setState(() {
      _filters=filterData;

      _availableMeals=DUMMY_MEALS.where((meal)
      {
        if(_filters['gluten']!&&!meal.isGlutenFree)
        {
          return false;
        }
        if(_filters['lactose']!&&!meal.isLactoseFree)
        {
          return false;
        }
        if(_filters['vegetarian']!&&!meal.isVegetarian)
        {
          return false;
        }
        if(_filters['vegan']!&&!meal.isVegan)
        {
          return false;
        }
        return true;
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      routes: {
        '/':(context) => TabsScreen(),
        CategoryMealScreen.routeName:(context) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName:(ctx)=>MealDetailScreen(),
        FiltersScreen.routeName:(ctx)=>FiltersScreen( _setFilters),
      },
       
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Color.fromARGB(255, 120, 131, 205),
        accentColor: Color.fromARGB(255, 92, 181, 225)
      ),
      
    );
  }
}