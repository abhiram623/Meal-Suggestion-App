import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/category.dart';
import 'package:food_app/provider/favourite_categories_provider.dart';

class CategoriesDetailsScreen extends ConsumerWidget {
  const CategoriesDetailsScreen({super.key, required this.category});
  
  final Category category;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed:() {
       final isAdded =   ref.read(favouriteCategoriesProvider.notifier).toggleCategoriesFavourite(category);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: isAdded ? Text("Category added") : Text("Category Removed")));

        }, icon: Icon(Icons.add))],
      ),
      body: Center(
        child: Text(category.title,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}