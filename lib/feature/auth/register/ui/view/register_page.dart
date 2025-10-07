import 'package:dotted_border/dotted_border.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view/widget/custom_register_form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(left: 0, child: Image.asset(AppImages.bubble5Images)),
            Positioned(
              right: 0,
              top: 75,
              child: Image.asset(AppImages.bubble6Images),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create \nAccount',
                    style: AppStyles.styleBold52(context),
                  ),
                  SizedBox(height: 54),
                  InkWell(
                    onTap: () {},
                    child: DottedBorder(
                      options: CircularDottedBorderOptions(
                        color: AppColors.primryColor,
                        strokeCap: StrokeCap.round,
                        strokeWidth: 2,
                        dashPattern: [12, 10],
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Container(
                          padding: EdgeInsets.all(24),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.primryColor,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 32),
                  CustomRegisterForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
