
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomProductCard extends StatelessWidget {
  final int index;
  const CustomProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImages.proIcon,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Nike Sportswear Club Fleece',
              style: AppStyles.styleRegular15(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              r'$99',
              style: AppStyles.styleRegular22(context).copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AppImages.wishIcon),
            ),
          ),
        ),
      ],
    );
  }
}
