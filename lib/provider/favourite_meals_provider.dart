import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier <List<Meal>>{
FavouriteMealsNotifier() : super([]);
bool toggleMealsFavourite (Meal meal){
final mealisFavourite = state.contains(meal);

if(mealisFavourite){
state = state.where((element) => element.id != meal.id).toList();
return false;
}else{
  state = [...state,meal];
return true;
}
}
}




final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier,List<Meal>>((ref){
return FavouriteMealsNotifier();
}
);