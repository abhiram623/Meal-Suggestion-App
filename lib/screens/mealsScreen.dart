import 'package:flutter/material.dart';
import 'package:food_app/models/category.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/meals_details_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals,  this.title});
  final List<Meal> meals;
  final String? title;
 


  @override
  Widget _mealsCard(int index, BuildContext context) {
    return GestureDetector(
onTap:() {
  Navigator.push(context,MaterialPageRoute(builder:(context) => MealsDetailsScreen(meal: meals[index]),));
  
},
      child: Stack(children: [
        Container(
          margin: EdgeInsets.all(8),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: Image(
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              image: NetworkImage(meals[index].imageUrl)),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              color: Colors.black38,
              child: Column(
                children: [
                  Text(
                    meals[index].title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Icon(Icons.lock_clock),
                        SizedBox(width: 10,),
                        Text("${meals[index].duration.toString()} min", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),
            ))
      ]),
    );
  }

  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap:() {
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => MealsDetailsScreen(meal: meals[index]),));
            }, 
              
              child: _mealsCard(index, context));
        },
      );



    if(title == null){
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text(title!),
      ),
      body: content
    );
  }
}
