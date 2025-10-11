import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CustomRowreview extends StatelessWidget {
  const CustomRowreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey3Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImages.proViewIcon,
                fit: BoxFit.fill,
                height: 85,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey3Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImages.proView1Icon,
                fit: BoxFit.fill,
                height: 85,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey3Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImages.proView2Icon,
                fit: BoxFit.fill,
                height: 85,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey3Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImages.proView3Icon,
                fit: BoxFit.fill,
                height: 85,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
