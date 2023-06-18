import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:foochi/app/controllers/food_dish_controller.dart';
import 'package:foochi/app/models/categories.dart';
import 'package:foochi/app/modules/menu/components/main_dishes_card.dart';
import 'package:get/get.dart';

class MainDishesView extends StatelessWidget {
  const MainDishesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 159.w / 179.h,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.h,
        children: List.generate(
          dishCategories.length,
          (int index) {
            final dishesCount = Get.find<FoodDishController>()
                .calculateDishesCount(dishCategories[index]);
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: 2,
              child: ScaleAnimation(
                child: FadeInAnimation(
                    child: MainDishesCard(
                  categories: dishCategories[index],
                  availableDishes: dishesCount,
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
