import 'package:flutter/material.dart';
import 'package:food_app/models/category.dart';
import 'package:food_app/models/meal.dart';


import 'package:food_app/screens/mealsScreen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.context, required this.availableMeals, });
 
  final BuildContext context;
  final List<Meal> availableMeals;
  

  

Widget _categoryCard (int index)
{


   return GestureDetector(

    
    onTap: () {
      final filtered = availableMeals.where((element) => element.categories.contains(availableCategories[index].id),).toList();
   
      Navigator.of(context).push(MaterialPageRoute(builder:(context) => MealsScreen(meals: filtered),));
    },
     child: Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
   gradient: LinearGradient(colors: [
     availableCategories[index].color,
     Colors.blue
   ])
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Text(
          textAlign: TextAlign.center,
          availableCategories[index].title,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
      ),
     ),
   );
}

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      //  appBar: AppBar(leading: IconButton(onPressed:() {
         
      //  }, icon: Icon(Icons.menu)),),
       
      body: ListView.builder(
          itemCount: availableCategories.length,
          scrollDirection: Axis.vertical,
          itemBuilder:(context, index) {
           return _categoryCard(index);
          },
      ),
    );
  }
}