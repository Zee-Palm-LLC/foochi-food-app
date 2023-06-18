import 'package:foochi/app/models/categories.dart';
import 'package:foochi/app/models/food_dish.dart';
import 'package:get/get.dart';

class FoodDishController extends GetxController {
  Rx<DishCategory?> _selectedCategory = Rx<DishCategory?>(null);
  DishCategory? get selectedCategory => _selectedCategory.value;
  Rx<List<FoodDish>> _filteredDishes = Rx<List<FoodDish>>([]);
  List<FoodDish> get filteredDishes => _filteredDishes.value;

  void filterDishesByCategory(DishCategory? category) {
    _selectedCategory.value = category;
    if (category != null) {
      _filteredDishes.value =
          foodDishes.where((dish) => dish.category == category).toList();
    } else {
      _filteredDishes.value = foodDishes;
    }
  }

  int calculateDishesCount(DishCategory category) {
    return foodDishes
        .where((dish) => dish.category == category)
        .toList()
        .length;
  }

  @override
  void onInit() {
    _selectedCategory.value = dishCategories[0];
    filterDishesByCategory(_selectedCategory.value);
    super.onInit();
  }
}
