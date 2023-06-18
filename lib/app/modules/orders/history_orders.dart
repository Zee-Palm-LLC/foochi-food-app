import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foochi/app/data/constants/constants.dart';
import 'package:foochi/app/modules/orders/components/previous_order_card.dart';
import 'package:foochi/app/modules/widgets/buttons/custom_icon_button.dart';

class HistoryOrders extends StatelessWidget {
  const HistoryOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, i) {
          return Slidable(
              endActionPane: ActionPane(
                extentRatio: 0.5,
                motion: const ScrollMotion(),
                children: [
                  SizedBox(width: 20.w),
                  CustomIconButton(
                    icon: AppAssets.kCart,
                    onTap: () {},
                  ),
                  SizedBox(width: 5.w),
                  CustomIconButton(
                    icon: AppAssets.kStar,
                    onTap: () {},
                  ),
                  SizedBox(width: 5.w),
                  CustomIconButton(
                    icon: AppAssets.kDelete,
                    onTap: () {},
                  ),
                ],
              ),
              child: const PreviousOrderCard(
                isHistoryView: true,
                color: AppColors.kLightPink,
              ));
        },
        separatorBuilder: (ctx, i) => SizedBox(height: 20.h),
        itemCount: 2);
  }
}
