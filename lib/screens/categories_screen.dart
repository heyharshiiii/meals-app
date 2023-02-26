import 'package:all_recipes/widgets/category_item.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(15),
        children: 
          DUMMY_CATEGORIES
          .map(
          (catData) 
          =>
             CategoryItem(
              catData.id,
               catData.title,
              catData.color,
            ),
          ).toList(),
        gridDelegate:
         SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20, //vertical space
          mainAxisSpacing:  20, //horizontal space 
           ),
      );
  }
}