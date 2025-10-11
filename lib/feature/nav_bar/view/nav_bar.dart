import 'package:e_commerce_app/core/DI/setup_get_it.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/home/ui/view/basket_page.dart';
import 'package:e_commerce_app/feature/home/ui/view/wishlist_page.dart';
import 'package:e_commerce_app/feature/home/ui/view/home_page.dart';
import 'package:e_commerce_app/feature/home/ui/view/payment_page.dart';
import 'package:e_commerce_app/feature/home/ui/view_model/favorites_cubit/favorites_cubit.dart';
import 'package:e_commerce_app/feature/home/ui/view_model/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/feature/nav_bar/view_model/nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarPage extends StatelessWidget {
  const NavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: BlocBuilder<NavBarCubit, int>(
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ProductCubit>(
                create: (context) => getIt<ProductCubit>()..getProduct(),
              ),
              BlocProvider<FavoritesCubit>(
                create: (context) => getIt<FavoritesCubit>(),
              ),
            ],
            child: IndexedStack(
              index: state,
              children: [
                HomePage(),
                WishlistPage(),
                BasketPage(),
                PaymentPage(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<NavBarCubit, int>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: AppColors.grey2Color,
                  blurRadius: 20,
                  spreadRadius: 0.1,
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              backgroundColor: AppColors.whiteColor,
              selectedLabelStyle: AppStyles.styleRegular15(context),
              unselectedLabelStyle: AppStyles.styleRegular12(context),
              currentIndex: state,
              onTap: (value) {
                BlocProvider.of<NavBarCubit>(context).changeTab(value);
              },
              items: [
                _buildBottomNavigationBarItem('Home', AppImages.homeIcon),

                _buildBottomNavigationBarItem('Wishlist', AppImages.wishIcon),
                _buildBottomNavigationBarItem('Basket', AppImages.lockNavIcon),

                _buildBottomNavigationBarItem('Payment', AppImages.paymentIcon),
              ],
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String selectedText,
    String unselectedIcon,
  ) {
    return BottomNavigationBarItem(
      activeIcon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          selectedText,
          style: TextStyle(
            color: AppColors.primryColor,
            fontSize: 15,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      icon: SvgPicture.asset(unselectedIcon),
      label: '',
    );
  }
}
