import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/mealnew_model.dart';
import 'package:food_app/provider/newmeal_provider.dart';

class NewMealScreen extends ConsumerWidget {
  const NewMealScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {


    AsyncValue<NewMeal> getRandomMeal = ref.watch(fetchMealProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Tutorial"),
        centerTitle: true,
      ),
      body: getRandomMeal.when(data:(data) {
        return RefreshIndicator(
          onRefresh: () => ref.refresh(fetchMealProvider.future),
          child: ListView(
            
            children: [
              Text(data.strMeal),
              Text(data.strCategory),
              Text(data.strArea),
              Text(data.idMeal.toString())
          ],),
        );
      }, error:(error, stackTrace) {
        return Center(child: Text(error.toString()),);
      }, loading:() {
        return Center(child: CircularProgressIndicator(),);
      },),
    );
  }
}