import 'package:all_recipes/models/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName= '/meal-detail';
  Widget buildSectionTitle( BuildContext context,String text)
  {
    return Container(
            margin: EdgeInsets.symmetric(vertical: 10,),
            child: Text(text,
            style: TextStyle(
              fontFamily: 'PTSerif',
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 2.0,
              decoration: TextDecoration.underline 
            ),
            ),
          );
  }
  Widget buildContainer(Widget child)
  {
    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 200,
            width: 500,
          child:child,);
  }
  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
                ),
            ),
            buildSectionTitle(context, 'Ingedients'),
              buildContainer(
             ListView.builder(
              itemBuilder: (ctx,index)=>Card(
                color:Theme.of(context).accentColor,
                child: Padding(
                  padding: 
                   EdgeInsets.symmetric(
                    vertical:10.0,
                    horizontal: 10.0 
                    ),
                  child: Center(child: Text(selectedMeal.ingredients[index])),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
              ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                  ListView.builder(
                    itemBuilder: (ctx,index)=>Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${(index+1)}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(
                          
                        ),
                      ],
                      
                    ),
                    
                    itemCount: selectedMeal.steps.length,)
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: (){
        Navigator.of(context).pop();
      }),
    );
  }
}