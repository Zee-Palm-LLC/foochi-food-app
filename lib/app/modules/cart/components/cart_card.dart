import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/app/data/constants/constants.dart';
import 'package:foochi/app/models/food_dish.dart';
import 'package:foochi/app/modules/home/components/quantity_card.dart';
import 'package:foochi/app/modules/widgets/buttons/custom_icon_button.dart';

class CartCard extends StatelessWidget {
  final FoodDish dish;
  final VoidCallback deleteFromCart;
  const CartCard({super.key,required this.dish,required this.deleteFromCart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(dish.image, height: 100.h,fit: BoxFit.fitHeight,),
        SizedBox(height: 5.h),
        Text(dish.name, style: AppTypography.kExtraLight15),
        Text('\$${dish.price}', style: AppTypography.kMedium14),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuantitySelector(
              borderCol: AppColors.kLine2,
              initialQuantity: 1,
              onChanged: (value) {},
            ),
            SizedBox(width: 5.w),
            CustomIconButton(
              onTap: deleteFromCart,
              icon: AppAssets.kDelete,
              size: 40,
              borderCol: Colors.transparent,
              iconColor: AppColors.kPrimary,
            )
          ],
        )
      ],
    );
  }
}
