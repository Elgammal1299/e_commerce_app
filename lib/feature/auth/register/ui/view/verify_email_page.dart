import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/widget/custom_text_form.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view/widget/custom_pin_code_widget.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          Positioned(left: 0, child: Image.asset(AppImages.bubble2Images)),
          Positioned(left: 0, child: Image.asset(AppImages.bubble1Images)),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 150),
                CircleAvatar(
                  radius: 55,
                  backgroundColor: AppColors.whiteColor,
                  child: CircleAvatar(
                    radius: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(50),
                      child: Image.asset(AppImages.avatarImages),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('Hello, Ahmed !!', style: AppStyles.styleBold52(context)),
                SizedBox(height: 16),
                Text(
                  'Type your email',
                  style: AppStyles.styleRegular20(context),
                ),
                SizedBox(height: 16),
                CustomTextForm(hintText: 'Email'),
                SizedBox(height: 16),
                Text('Type your OTP', style: AppStyles.styleRegular20(context)),
                SizedBox(height: 16),
                CustomPinCodeWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
