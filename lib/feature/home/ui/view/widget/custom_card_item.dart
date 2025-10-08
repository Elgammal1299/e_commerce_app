import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: AppColors.grey2Color, blurRadius: 5),
          BoxShadow(color: AppColors.greyColor, blurRadius: 5),
        ],
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.greyColor,
            ),
            child: Image.asset(AppImages.pro3Icon, width: 100, height: 100),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Men\'s Tie-Dye T-Shirt\nNike Sportswear',
                style: AppStyles.styleRegular20(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                r'$45 (-$4.00 Tax)',
                style: AppStyles.styleRegular15(context),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      border: Border.all(color: AppColors.grey2Color, width: 1),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.grey2Color,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text('1'),
                  SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      border: Border.all(color: AppColors.grey2Color, width: 1),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: AppColors.grey2Color,
                    ),
                  ),
                  SizedBox(width: 75),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      border: Border.all(color: AppColors.grey2Color, width: 1),
                    ),
                    child: Icon(
                      Icons.delete_outlined,
                      color: AppColors.grey2Color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
