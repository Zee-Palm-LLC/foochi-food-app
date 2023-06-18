import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/app/data/constants/constants.dart';
import 'package:foochi/app/models/credit_card.dart';
import 'package:foochi/app/modules/profile/components/credit_card.dart';
import 'package:foochi/app/modules/widgets/buttons/custom_icon_button.dart';
import 'package:foochi/app/modules/widgets/buttons/custom_text_button.dart';
import 'package:foochi/app/modules/widgets/buttons/primary_button.dart';

class PaymentView extends StatelessWidget {
  final VoidCallback addPaymentCard;
  final List<CreditCardModel> creditCard;
  const PaymentView(
      {super.key, required this.addPaymentCard, required this.creditCard});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text('My Card', style: AppTypography.kBold18),
              const Spacer(),
              CustomTextButton(
                onPressed: addPaymentCard,
                text: 'Add Card',
              )
            ],
          ),
        ),
        Swiper(
          itemBuilder: (BuildContext context, int index) {
            return CreditCard(
              creditCard: creditCard[index],
            );
          },
          fade: 0,
          axisDirection: AxisDirection.up,
          itemCount: creditCard.length,
          itemWidth: double.maxFinite,
          itemHeight: 196.h,
          layout: SwiperLayout.TINDER,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('My Paypal', style: AppTypography.kBold18),
                  Text(
                    'cuonght@gmail.com',
                    style: AppTypography.kExtraLight15,
                  ),
                ],
              ),
              const Spacer(),
              CustomIconButton(
                onTap: () {},
                icon: AppAssets.kEdit,
              )
            ],
          ),
        ),
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: PrimaryButton(
            onTap: () {},
            text: 'Save Payment',
          ),
        )
      ],
    );
  }
}
