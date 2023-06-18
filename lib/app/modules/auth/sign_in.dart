import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/app/data/constants/constants.dart';
import 'package:foochi/app/modules/auth/components/auth_field.dart';
import 'package:foochi/app/modules/auth/components/social_icons_row.dart';
import 'package:foochi/app/modules/auth/sign_up.dart';
import 'package:foochi/app/modules/landing/landing_page.dart';
import 'package:foochi/app/modules/widgets/animation/custom_animation.dart';
import 'package:foochi/app/modules/widgets/buttons/custom_text_button.dart';
import 'package:foochi/app/modules/widgets/buttons/primary_button.dart';
import 'package:foochi/app/modules/widgets/dialogs/loading_dialog.dart';
import 'package:get/get.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isEmailCorrect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: FadeAnimation(
            delay: 1,
            child: Column(
              children: [
                SizedBox(height: 80.h),
                Center(child: Image.asset(AppAssets.kAppLogo)),
                SizedBox(height: 30.h),
                Text('Sign In',
                    style: AppTypography.kBold30
                        .copyWith(color: AppColors.kSecondary)),
                SizedBox(height: 24.h),
                SocialIconRow(
                  facebookCallback: () {
                    debugPrint('Facebook');
                  },
                  googleCallback: () {
                    debugPrint('Google');
                  },
                  twitterCallback: () {
                    debugPrint('Twitter');
                  },
                ),
                SizedBox(height: 30.h),
                Text('Or with Email', style: AppTypography.kLight14),
                SizedBox(height: 23.h),
                AuthField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  isFieldValidated: isEmailCorrect,
                  onChanged: (value) {
                    setState(() {});
                    isEmailCorrect = validateEmail(value);
                  },
                  hintText: 'Your Email',
                  validator: (value) {
                    if (!validateEmail(value!)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSpacing.twentyVertical),
                AuthField(
                  hintText: 'Your Password',
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  isForgetButton: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password should be at least 6 characters';
                    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$')
                        .hasMatch(value)) {
                      return 'Password should contain at least one uppercase letter, one lowercase letter, and one digit';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.h),
                PrimaryButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        showLoading();
                        await Future.delayed(const Duration(seconds: 3));
                        hideLoading();
                        Get.offAll(() => const LandingPage());
                      }
                    },
                    text: 'Sign In'),
                SizedBox(height: 60.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New User?',
                        style: AppTypography.kLight14.copyWith(
                          color: AppColors.kSecondary,
                        )),
                    CustomTextButton(
                      onPressed: () {
                        Get.to(() => const SignUpView());
                      },
                      text: 'Sign Up',
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
      );
      return emailRegex.hasMatch(value);
    }
  }
}
