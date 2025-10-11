import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomReviewItem extends StatelessWidget {
  const CustomReviewItem({super.key, required this.image, required this.title, required this.rating});
  final String image;
  final String title;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),

              child: Image.asset(
                image,
                width: 50,
                height: 50,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.styleRegular20(
                    context,
                  ).copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Row(
                  children: [
                    Icon(Icons.alarm),
                    SizedBox(width: 4),
                    Text(
                      '13 Sep, 2020',
                      style: AppStyles.styleRegular15(context),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text('${rating.toString()} rating', style: AppStyles.styleRegular20(context)),
                SizedBox(height: 7),
                Text('⭐⭐⭐⭐'),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
          style: AppStyles.styleRegular15(context),
        ),
      ],
    );
  }
}
