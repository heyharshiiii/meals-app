import 'package:all_recipes/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName='/filters';
  final Function saveFilters;
  
  FiltersScreen(this.saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree=false;
  var _vegetarian=false;
  var _vegan=false;
  var _lactoseFree=false;

@override
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters',
       ),
       actions: [
        IconButton(icon:Icon(Icons.save),
        onPressed: (){
          final selectedFilters={
            'gluten':_glutenFree,
    'lactose':_lactoseFree,
    'vegan':_vegan,
    'vegetarian':_vegetarian,
          };
           widget.saveFilters(selectedFilters);
        }
         
        )
       ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
             style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
          
        )),
          ),
          Expanded(child: ListView(
            children: [
              SwitchListTile(
                title: Text('Gluten-Free',
                 style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400
        )),
                value: _glutenFree,
                subtitle: Text(
                  'Only include gluten Free meals',
                ),
                onChanged:(newValue){
                    setState(() {
                      _glutenFree=newValue;
                    });
                }),
                SwitchListTile(
                title: Text('Lactose-Free',
                 style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400
        )),
                value: _lactoseFree,
                subtitle: Text(
                  'Only include Lactose Free meals',
                ),
                onChanged:(newValue){
                    setState(() {
                      _lactoseFree=newValue;
                    });
                }),
                SwitchListTile(
                title: Text('Vegetarian',
                 style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400
        )),
                value: _vegetarian,
                subtitle: Text(
                  'Only include Vegetarian meals',
                ),
                onChanged:(newValue){
                    setState(() {
                      _vegetarian=newValue;
                    });
                }),
                SwitchListTile(
                title: Text('Vegan',
                 style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400
        )),
                value: _vegan,
                subtitle: Text(
                  'Only include Vegan meals',
                ),
                onChanged:(newValue){
                    setState(() {
                      _vegan=newValue;
                    });
                }),
            ],
          ))
        ],
      )
    );
  }
}