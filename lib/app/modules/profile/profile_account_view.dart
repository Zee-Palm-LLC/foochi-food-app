import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/app/data/constants/constants.dart';
import 'package:foochi/app/models/user_model.dart';
import 'package:foochi/app/modules/auth/components/auth_field.dart';
import 'package:foochi/app/modules/auth/sign_in.dart';
import 'package:foochi/app/modules/widgets/buttons/custom_icon_button.dart';
import 'package:foochi/app/modules/widgets/buttons/primary_button.dart';
import 'package:foochi/app/modules/widgets/dialogs/loading_dialog.dart';
import 'package:foochi/app/modules/widgets/dialogs/logout_dialog.dart';
import 'package:get/get.dart';

class ProfileAccountView extends StatefulWidget {
  const ProfileAccountView({super.key});

  @override
  State<ProfileAccountView> createState() => _ProfileAccountViewState();
}

class _ProfileAccountViewState extends State<ProfileAccountView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _numberController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    _nameController.text = currentUser.name;
    _emailController.text = currentUser.email;
    _numberController.text = currentUser.phoneNumber;
    _addressController.text = currentUser.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          AuthField(
            controller: _nameController,
            hintText: 'Tony Nguyen',
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: 10.h),
          AuthField(
            controller: _emailController,
            hintText: 'cuonght@gmail.com',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10.h),
          AuthField(
            controller: _passwordController,
            isPasswordField: true,
            hintText: '*********',
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: 10.h),
          AuthField(
            controller: _numberController,
            hintText: '+92 - 3341713052',
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: 10.h),
          AuthField(
            controller: _addressController,
            hintText: '004 Riley Street, 2050 Sydney',
            keyboardType: TextInputType.name,
          ),
          
          SizedBox(height: 30.h),
          Row(
            children: [
              CustomIconButton(
                onTap: () {
                  Get.dialog(LogoutDialog(
                    onLogout: () {
                      Get.offAll(() => const SignInView());
                    },
                  ));
                },
                icon: AppAssets.kLogout,
                size: 50.h,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: PrimaryButton(
                  onTap: () async {
                    showLoading();
                    await Future.delayed(const Duration(seconds: 3));
                    hideLoading();
                    Get.back();
                  },
                  height: 50.h,
                  borderRadius: 10.r,
                  text: 'Save Profile',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
