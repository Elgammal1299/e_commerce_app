import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomRowSize extends StatelessWidget {
  const CustomRowSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.grey3Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'S',
              style: AppStyles.styleSemiBold20(context),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(width: 10),

        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.grey3Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'M',
              style: AppStyles.styleSemiBold20(context),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(width: 10),

        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.grey3Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'L',
              style: AppStyles.styleSemiBold20(context),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(width: 10),

        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.grey3Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'XL',
              style: AppStyles.styleSemiBold20(context),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(width: 10),

        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.grey3Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '2XL',
              style: AppStyles.styleSemiBold20(context),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
