import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/category.dart';

class FavouritecategoriesNotifier extends StateNotifier<List<Category>> {
  FavouritecategoriesNotifier() : super([]);

  bool toggleCategoriesFavourite(Category category) {
    final isFavourite = state.contains(category);

    if (isFavourite) {
      state = state.where((element) => element.id != category.id).toList();
      return false;
    } else {
      state = [...state, category];
      return true;
    }
  }
}

final favouriteCategoriesProvider =
    StateNotifierProvider<FavouritecategoriesNotifier, List<Category>>(
        (ref) => FavouritecategoriesNotifier());
