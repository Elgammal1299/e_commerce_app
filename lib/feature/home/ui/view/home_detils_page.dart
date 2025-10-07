import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_review_item.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_row_rreview.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_row_size..dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_row_view_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeDetilsPage extends StatelessWidget {
  const HomeDetilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.primryColor),

          child: Text(
            textAlign: TextAlign.center,
            'Add to Cart',
            style: AppStyles.styleRegular20(
              context,
            ).copyWith(color: AppColors.whiteColor),
          ),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Image.asset(
                        height: MediaQuery.sizeOf(context).height / 2,
                        AppImages.proIcon,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                Text(
                                  'Men\'s Printed Pullover Hoodie',
                                  style: AppStyles.styleRegular15(context),
                                ),
                                Spacer(),
                                Text(
                                  'Price',
                                  style: AppStyles.styleRegular15(context),
                                ),
                                SizedBox(width: 20),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  'Nike Club Fleece',
                                  style: AppStyles.styleRegular20(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  r'$120',
                                  style: AppStyles.styleRegular20(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 15),
                              ],
                            ),
                            SizedBox(height: 16),
                            CustomRowreview(),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  'Size',
                                  style: AppStyles.styleRegular20(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  'Size Guide',
                                  style: AppStyles.styleRegular15(context),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            CustomRowSize(),
                            SizedBox(height: 20),
                            Text(
                              'Description',
                              style: AppStyles.styleRegular20(
                                context,
                              ).copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..',
                              style: AppStyles.styleRegular15(context),
                            ),
                            SizedBox(height: 10),
                            CustomRowViewAll(
                              title: 'Reviews',
                              onPresse: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.reviewRoute,
                                );
                              },
                            ),
                            SizedBox(height: 10),
                            CustomReviewItem(),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Total Price',
                                      style: AppStyles.styleRegular20(
                                        context,
                                      ).copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'with VAT,SD',
                                      style: AppStyles.styleRegular15(context),
                                    ),
                                  ],
                                ),
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
                    ],
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 50)),
              ],
            ),

            Positioned(
              top: 10,
              left: 16,
              right: 16,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: AppColors.grey3Color,
                    ),
                    child: Icon(Icons.arrow_back),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: AppColors.grey3Color,
                    ),
                    child: SvgPicture.asset(AppImages.lockIcon),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
