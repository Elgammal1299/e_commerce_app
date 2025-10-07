import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/auth/login/ui/view/widget/custom_login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          Positioned(left: 0, child: Image.asset(AppImages.bubble2Images)),
          Positioned(left: 0, child: Image.asset(AppImages.bubble1Images)),
          Positioned(
            right: 0,
            top: 300,
            child: Image.asset(AppImages.bubble3Images),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(AppImages.bubble4Images),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Login', style: AppStyles.styleBold52(context)),
                SizedBox(height: 4),
                Text(
                  'Good to see you back!  🖤',
                  style: AppStyles.styleRegular20(context),
                ),
                SizedBox(height: 16),
                CustomLoginForm(),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
