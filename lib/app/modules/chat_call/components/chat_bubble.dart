import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/app/data/constants/constants.dart';
import 'package:foochi/app/models/chat_model.dart';
import 'package:foochi/app/modules/home/components/profile_image_card.dart';

class ChatBubble extends StatelessWidget {
  final ChatModel chat;
  const ChatBubble({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return chat.isReceiver
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: AppColors.kPrimary,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Text(
                  chat.message,
                  style:
                      AppTypography.kLight13.copyWith(color: AppColors.kWhite),
                ),
              ),
              SizedBox(width: 10.w),
              ProfileImageCard(size: 40.h)
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileImageCard(size: 40.h,
              image: chat.sender.profilePic,
              ),
              SizedBox(width: 10.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: AppColors.kOrange,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Text(
                  chat.message,
                  style:
                      AppTypography.kLight13.copyWith(color: AppColors.kWhite),
                ),
              ),
            ],
          );
  }
}
