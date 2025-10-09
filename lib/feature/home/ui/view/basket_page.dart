import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_card_item.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_list_tile_item.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text('Card'),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCardItem(image: AppImages.pro3Icon),
              SizedBox(height: 20),
              CustomCardItem(image: AppImages.proIcon),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Delivery Address',
                    style: AppStyles.styleRegular20(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
              CustomListTileItem(
                title: 'Chhatak, Sunamgonj 12/8AB',
                supTitle: 'Sylhet',
                image: AppImages.mapIcon,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Payment Method',
                    style: AppStyles.styleRegular20(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
              CustomListTileItem(
                title: 'Visa Classic',
                supTitle: '**** 7690',
                image: AppImages.visaIcon,
              ),
              SizedBox(height: 20),

              Text(
                'Order Info',
                style: AppStyles.styleRegular20(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text('Subtotal', style: AppStyles.styleRegular15(context)),
                  Spacer(),
                  Text(
                    r'$110',
                    style: AppStyles.styleRegular20(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    'Shipping cost',
                    style: AppStyles.styleRegular15(context),
                  ),
                  Spacer(),
                  Text(
                    r'$10',
                    style: AppStyles.styleRegular20(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text('Total', style: AppStyles.styleRegular15(context)),
                  Spacer(),
                  Text(
                    r'$120',
                    style: AppStyles.styleRegular20(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
