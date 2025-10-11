
import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/core/utils/widget/custom_product_card_shimmer.dart';
import 'package:e_commerce_app/feature/home/ui/view/widget/custom_product_card.dart';
import 'package:e_commerce_app/feature/home/ui/view_model/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                final productId = products[index].id.toString();
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.homeDetilsRoute,
                      arguments: productId,
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
