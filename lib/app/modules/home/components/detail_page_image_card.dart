import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/app/data/constants/constants.dart';
import 'package:foochi/app/models/food_dish.dart';
import 'package:foochi/app/modules/home/components/quantity_card.dart';
import 'package:foochi/app/modules/home/components/spinning_circle.dart';
import 'package:foochi/app/modules/widgets/buttons/custom_icon_button.dart';

class DetailPageImageCard extends StatelessWidget {
  final FoodDish dish;
  final VoidCallback addToCart;
  const DetailPageImageCard(
      {super.key, required this.dish, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 347.h,
        width: 331.w,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.kDetailBg),
            SpinningCircle(image: dish.image),
            Positioned(
              right: 40,
              bottom: 100,
              child: CustomIconButton(
                icon: AppAssets.kAdd,
                borderCol: Colors.transparent,
                iconColor: AppColors.kPrimary,
                onTap: addToCart,
              ),
            ),
            Positioned(
              right: 90,
              bottom: 47,
              child: CustomIconButton(
                icon: AppAssets.kFavorite,
                size: 40,
                borderCol: Colors.transparent,
                iconColor: AppColors.kOrange,
                onTap: () {},
              ),
            ),
            Positioned(
                bottom: -10,
                child: QuantitySelector(
                  initialQuantity: 1,
                  onChanged: (value) {},
                ))
          ],
        ),
      ),
    );
  }
}
