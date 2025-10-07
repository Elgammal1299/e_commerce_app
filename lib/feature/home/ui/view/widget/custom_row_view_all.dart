import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomRowViewAll extends StatelessWidget {
  const CustomRowViewAll({
    super.key,
    required this.title,
    required this.onPresse,
  });
  final String title;
  final Function() onPresse;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppStyles.styleSemiBold20(context)),
        Spacer(),
        TextButton(
          onPressed: onPresse,
          child: Text('View All', style: AppStyles.styleRegular15(context)),
        ),
      ],
    );
  }
}
