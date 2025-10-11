import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/widget/custom_product_card_shimmer.dart';
import 'package:e_commerce_app/core/utils/widget/custom_text_form.dart';
import 'package:e_commerce_app/feature/home/data/model/brand_model.dart';
import 'package:e_commerce_app/feature/home/data/model/product_model2.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_band_list.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_product_card.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_row_view_all.dart';
import 'package:e_commerce_app/feature/home/ui/view_model/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.grey3Color,
                    ),
                    child: SvgPicture.asset(AppImages.menuIcon),
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
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Text('Hello', style: AppStyles.styleBold52(context)),
                        Text(
                          'Welcome to Laza.',
                          style: AppStyles.styleRegular15(context),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: CustomTextForm(
                                hintText: 'Search',
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SvgPicture.asset(AppImages.voiceIcon),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        CustomRowViewAll(
                          title: 'Choose Brand',
                          onPresse: () {},
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 50,
                          child: CustomBrandList(brands: brands),
                        ),
                        const SizedBox(height: 15),
                        CustomRowViewAll(title: 'New Arrival', onPresse: () {}),
                        const SizedBox(height: 15),
                      ]),
                    ),
                  ),

                  CustomProductList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomProductList extends StatelessWidget {
//   const CustomProductList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SliverPadding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       sliver: SliverGrid(
//         gridDelegate:
//             const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 12,
//               crossAxisSpacing: 12,
//               childAspectRatio: 0.65,
//             ),
//         delegate: SliverChildBuilderDelegate(
//           childCount: products.length,
//           (context, index) {
//             return InkWell(
//               onTap: () {
//                 Navigator.pushNamed(
//                   context,
//                   Routes.homeDetilsRoute,
//                 );
//               },
//               child: CustomProductCard(product: products[index]),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class CustomProductList extends StatelessWidget {
  const CustomProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => const CustomProductCardShimmer(),
                childCount: 6, // عدد الكروت اللي عايز تظهر
              ),
            ),
          );
        } else if (state is ProductError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        } else if (state is ProductSuccess) {
          final products = state.productModel.items;

          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final product = products[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.homeDetilsRoute,
                      arguments: product,
                    );
                  },
                  child: CustomProductCard(product: product),
                );
              }, childCount: products.length),
            ),
          );
        } else {
          context.read<ProductCubit>().getProduct();
          return const SliverToBoxAdapter(child: CustomProductCardShimmer());
        }
      },
    );
  }
}
