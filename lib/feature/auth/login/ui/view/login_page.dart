import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/widget/custom_elevated_button.dart';
import 'package:e_commerce_app/core/utils/widget/custom_text_form.dart';
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
                CustomTextForm(hintText: 'Email'),
                SizedBox(height: 40),
                CustomElevatedButton(text: 'Next', onPressed: () {}),
                SizedBox(height: 14),
                Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: TextButton(onPressed: () {}, child: Text('Cancel')),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
