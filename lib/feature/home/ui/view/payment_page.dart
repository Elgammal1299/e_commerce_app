import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/widget/custom_elevated_button.dart';
import 'package:e_commerce_app/core/utils/widget/custom_text_form.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(title: Text('Payment'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentGeometry.center,
              child: Image.asset(AppImages.paymentImage),
            ),
            SizedBox(height: 15),
            CustomElevatedButton(
              icon: Icon(Icons.add, color: AppColors.primryColor),
              backgroundColor: AppColors.grey3Color,
              borderColor: AppColors.primryColor,
              heigth: 50,
              textStyle: AppStyles.styleRegular22(
                context,
              ).copyWith(color: AppColors.primryColor),

              text: 'Add new card',
              onPressed: () {},
              borderRadius: 10,
            ),
            SizedBox(height: 20),
            Text(
              'Card Owner',
              style: AppStyles.styleRegular20(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CustomTextForm(
              hintText: 'Mrh Raju',
              borderRadius: BorderRadius.circular(12),
            ),
            SizedBox(height: 15),
            Text(
              'Card Number',
              style: AppStyles.styleRegular20(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CustomTextForm(
              hintText: '5254 7634 8734 7690',
              borderRadius: BorderRadius.circular(12),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EXP',
                        style: AppStyles.styleRegular20(
                          context,
                        ).copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      CustomTextForm(
                        hintText: '24/24',
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CVV',
                        style: AppStyles.styleRegular20(
                          context,
                        ).copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      CustomTextForm(
                        hintText: '5254 ',
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SwitchListTile(
              contentPadding: EdgeInsets.all(0),
              activeThumbColor: Colors.green,
              value: true,
              onChanged: (w) {},
              title: Text('Save card info'),
            ),
          ],
        ),
      ),
    );
  }
}
