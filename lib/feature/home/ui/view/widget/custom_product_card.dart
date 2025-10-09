
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/home/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomProductCard extends StatelessWidget {
  final ProductModel product;
  const CustomProductCard({super.key, required this.product});

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
                product.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: AppStyles.styleRegular15(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '\$${product.price}',
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
              child: SvgPicture.asset(
                
                AppImages.wishIcon
              ),
            ),
          ),
        ),
      ],
    );
  }
}