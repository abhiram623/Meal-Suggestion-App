import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/category.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/provider/favourite_categories_provider.dart';
import 'package:food_app/provider/filters_provider.dart';
import 'package:food_app/screens/categories_screen.dart';
import 'package:food_app/screens/counter_screen.dart';
import 'package:food_app/screens/filteres_screens.dart';
import 'package:food_app/screens/mealsScreen.dart';
import 'package:food_app/provider/favourite_meals_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _showInfoMessage(String message) {
  
  }

  @override
  Widget build(BuildContext context) {


   final activeFilters =  ref.watch(filtersProvider);
    final availableMeals = dummyMeals.where((element) {
      if(activeFilters[Filter.glutenFree]! && !element.isGlutenFree){
        return false;
      }
      if(activeFilters[Filter.lactoseFree]!  && !element.isLactoseFree){
       return false; 
      }
      if(activeFilters[Filter.vegeterian]!  && !element.isVegetarian){
       return false; 
      }
      if(activeFilters[Filter.vegan]!  && !element.isVegan){
       return false; 
      }
      return true;
    }).toList();
    
    Widget activePage = CategoryScreen(
      context: context, availableMeals: availableMeals, 
    );
    var activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
    final meals =  ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: meals,
      );
      activePageTitle = "Your Favourites";
    }
  //    if (_selectedPageIndex == 1) {
  //  final categories = ref.watch(favouriteCategoriesProvider);
  //     activePage =CategoryScreen(context: context, categories: categories);
  //     activePageTitle = "Your Favourites";
  //   }

    return Scaffold(
      
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      colors: [Colors.green, Colors.greenAccent])),
              child: Row(
                children: [
                  Icon(Icons.cookie_outlined),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Cooking Up!",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Color.fromARGB(255, 255, 223, 223),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.food_bank),
              title: Text("Meals"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop(context);
              },
            ),
            ListTile(
              onTap: () async {
                final result = await Navigator.of(context)
                    .push<Map<Filter , bool>>(MaterialPageRoute(
                  builder: (context) => FilterScreen(),
                ));

                print(result);
              },
              leading: Icon(Icons.filter_center_focus),
              title: Text("Filters"),
              trailing: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder:(context) => CounterScreen(),));
          }, icon: Icon(Icons.add))
        ],
        // leading: IconButton(onPressed:() {
        //   Drawer(child: Column(children: [
        //     DrawerHeader(child: Text("data"))
        //   ],),);
        // }, icon: Icon(Icons.menu)),
        title: Text(activePageTitle),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (value) {
            setState(() {
              _selectedPageIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(label: "", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.home))
          ]),
      body: activePage,
    );
  }
}
