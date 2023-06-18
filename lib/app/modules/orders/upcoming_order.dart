import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/app/data/constants/constants.dart';
import 'package:foochi/app/modules/orders/components/order_card.dart';
import 'package:foochi/app/modules/orders/components/previous_order_card.dart';

class UpcomingOrders extends StatelessWidget {
  const UpcomingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) {
                return const OrderCard();
              },
              separatorBuilder: (ctx, i) => SizedBox(height: 20.h),
              itemCount: 1),
          SizedBox(height: 30.h),
          Text('Latest Orders', style: AppTypography.kBold18),
          SizedBox(height: 20.h),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) {
                return const PreviousOrderCard();
              },
              separatorBuilder: (ctx, i) => SizedBox(height: 20.h),
              itemCount: 1),
        ],
      ),
    );
  }
}
