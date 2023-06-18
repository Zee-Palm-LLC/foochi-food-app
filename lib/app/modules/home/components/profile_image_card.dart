import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/app/data/constants/constants.dart';
import 'package:foochi/app/modules/profile/profile_view.dart';
import 'package:get/get.dart';

class ProfileImageCard extends StatelessWidget {
  final double? size;
  final String? image;
  const ProfileImageCard({Key? key, this.size, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProfileView());
      },
      child: Container(
        height: size ?? 46.h,
        width: size ?? 46.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
                image: AssetImage(image ?? AppAssets.kProfilePic),
                fit: BoxFit.cover)),
      ),
    );
  }
}
