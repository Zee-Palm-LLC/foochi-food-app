import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/app/modules/orders/components/order_card.dart';
import 'package:foochi/app/modules/orders/components/refund_order_card.dart';

class RefundOrders extends StatelessWidget {
  const RefundOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, i) {
          return const RefundOrderCard();
        },
        separatorBuilder: (ctx, i) => SizedBox(height: 20.h),
        itemCount: 1);
  }
}
