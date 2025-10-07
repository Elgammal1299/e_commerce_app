import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_review_item.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      appBar: AppBar(
        title: Text('Reviews'),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      '245 Reviews',
                      style: AppStyles.styleRegular20(context),
                    ),
                    Text('4.8 ⭐⭐⭐⭐'),
                  ],
                ),
                Spacer(),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  icon: Icon(Icons.add),
                  onPressed: () {},
                  label: Text('Add Review'),
                ),
              ],
            ),
            SizedBox(height: 30),
            CustomReviewItem(),
            SizedBox(height: 20),
            CustomReviewItem(),
            SizedBox(height: 20),
            CustomReviewItem(),
            SizedBox(height: 20),
            CustomReviewItem(),
            SizedBox(height: 20),
            CustomReviewItem(),
          ],
        ),
      ),
    );
  }
}
