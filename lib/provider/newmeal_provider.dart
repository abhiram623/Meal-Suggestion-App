import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/mealnew_model.dart';
import 'package:dio/dio.dart';

final fetchMealProvider = FutureProvider<NewMeal>((ref)async {
      final dio = Dio();
    
      final response = await dio.get("http://www.themealdb.com/api/json/v1/1/search.php?f=a");

     return NewMeal.fromJson(response.data["meals"][0]);  


});