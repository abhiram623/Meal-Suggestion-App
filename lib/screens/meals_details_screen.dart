

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/provider/favourite_meals_provider.dart';

class MealsDetailsScreen extends ConsumerWidget {
  const MealsDetailsScreen({super.key, required this.meal});
  final Meal meal;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),
      actions: [
        IconButton(onPressed: (){

      final wasAdded =   ref.read(favouriteMealsProvider.notifier).toggleMealsFavourite(meal);

           ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: wasAdded ? Text("meal Added") : Text("Meal Removed"),
    ));
             
         
      
         
        }, icon: Icon(Icons.star_border))
      ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.red,
              child: Image(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: NetworkImage(meal.imageUrl)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Color.fromARGB(255, 255, 251, 0),
                    fontSize: 23,
                    fontWeight: FontWeight.w600),
              ),
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Steps",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Color.fromARGB(255, 255, 251, 0),
                    fontSize: 23,
                    fontWeight: FontWeight.w600),
              ),
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                  textAlign: TextAlign.center,
                ),
              )
          ],
        ),
      ),
    );
  }
}
