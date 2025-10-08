
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomListTileItem extends StatelessWidget {
  const CustomListTileItem({
    super.key,
    required this.title,
    required this.supTitle,
    required this.image,
  });
  final String title;
  final String supTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        title,
        style: AppStyles.styleRegular20(
          context,
        ).copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(supTitle, style: AppStyles.styleRegular15(context)),
      trailing: Icon(Icons.check_circle, color: Colors.green),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.greyColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(image, width: 50, height: 50),
        ),
      ),
    );
  }
}
