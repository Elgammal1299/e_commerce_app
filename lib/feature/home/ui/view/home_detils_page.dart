import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_review_item.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_row_rreview.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_row_size..dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_row_view_all.dart';
import 'package:e_commerce_app/feature/home/ui/view_model/product_id_cubit/product_id_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDetilsPage extends StatelessWidget {
  final String productId;
  const HomeDetilsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(20),
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
        child: BlocBuilder<ProductIdCubit, ProductIdState>(
          builder: (context, state) {
            if (state is ProductIdLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductIdError) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is ProductIdSuccess) {
              final product = state.productModel;
              return Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl: product.coverPictureUrl,
                              height: MediaQuery.sizeOf(context).height / 2,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                height: 200,
                                width: double.infinity,
                                color: Colors.grey.shade300,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                AppImages.proIcon,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
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
                                        style: AppStyles.styleRegular15(
                                          context,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Price',
                                        style: AppStyles.styleRegular15(
                                          context,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        product.name,
                                        style: AppStyles.styleRegular20(
                                          context,
                                        ).copyWith(fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '\$${product.price}',
                                        style: AppStyles.styleRegular20(
                                          context,
                                        ).copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  CustomRowreview(item: state.productModel.productPictures),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Text(
                                        'Size',
                                        style: AppStyles.styleRegular20(
                                          context,
                                        ).copyWith(fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Size Guide',
                                        style: AppStyles.styleRegular15(
                                          context,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  CustomRowSize(),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Description',
                                    style: AppStyles.styleRegular20(
                                      context,
                                    ).copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    product.description,
                                    style: AppStyles.styleRegular15(context),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomRowViewAll(
                                    title: 'Reviews',
                                    onPresse: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.reviewRoute,
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  CustomReviewItem(
                                    image: AppImages.pro6Icon,
                                    title: 'Ronald Richards',
                                  ),
                                  const SizedBox(height: 50),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
