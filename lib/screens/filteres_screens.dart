import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/provider/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
     
      appBar: AppBar(
        
        title: Text("Your Filters"),
       
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text("Gluten-Free"),
            subtitle: Text("Only include gluten free meals"),
           value:activeFilters[Filter.glutenFree]!,
           onChanged:(value) {
             ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, value);
             
           },),
      
           SwitchListTile(
            title: Text("Lactose-Free"),
            subtitle: Text("Only include Lactose free meals"),
           value:activeFilters[Filter.lactoseFree]!,
           onChanged:(value) {
             ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, value);
             
           },),
      
           SwitchListTile(
            title: Text("Vegeterian"),
            subtitle: Text("Only include Vegeterian meals"),
           value:activeFilters[Filter.vegeterian]!,
           onChanged:(value) {
             ref.read(filtersProvider.notifier).setFilter(Filter.vegeterian, value);
             
           },),
      
           SwitchListTile(
            title: Text("Vegan"),
            subtitle: Text("Only include Vegan meals"),
           value:activeFilters[Filter.vegan]!,
           onChanged:(value) {
             ref.read(filtersProvider.notifier).setFilter(Filter.vegan, value);
             
           },),
      
          
        ],
      ),
    );
  }
}