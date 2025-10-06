import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(.2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: AppColors.whiteColor,
                radius: 67,
                child: Image.asset(AppImages.shoppeImages),
              ),
            ),
            SizedBox(height: 24),
            Text('Shoppe', style: AppStyles.styleBold52(context)),
            SizedBox(height: 18),
            Text(
              textAlign: TextAlign.center,
              'Beautiful eCommerce UI Kit\n for your online store',
              style: AppStyles.styleRegular20(context).copyWith(height: 2),
            ),
            Spacer(),
            CustomElevatedButton(
              text: 'Let\'s get started',
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.verifyEmailRoute,
                );
              },
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I already have an account',
                  style: AppStyles.styleRegular15(context),
                ),
                SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.primryColor,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
