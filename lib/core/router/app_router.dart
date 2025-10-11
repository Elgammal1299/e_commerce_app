import 'package:e_commerce_app/core/DI/setup_get_it.dart';
import 'package:e_commerce_app/core/router/router_transitions.dart';
import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/feature/auth/login/ui/view/start_page.dart';
import 'package:e_commerce_app/feature/auth/login/ui/view/login_page.dart';
import 'package:e_commerce_app/feature/auth/login/ui/view_model/login_cubit/login_cubit.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view/register_page.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view/verify_email_page.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view_model/register_cubit/register_cubit.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view_model/verify_email_cubit/verify_email_cubit.dart';
import 'package:e_commerce_app/feature/home/data/model/product_model.dart';
import 'package:e_commerce_app/feature/home/ui/view/home_detils_page.dart';
import 'package:e_commerce_app/feature/home/ui/view/home_page.dart';
import 'package:e_commerce_app/feature/home/ui/view/review_page.dart';
import 'package:e_commerce_app/feature/home/ui/view_model/product_id_cubit/product_id_cubit.dart';
import 'package:e_commerce_app/feature/nav_bar/view/nav_bar.dart';
import 'package:e_commerce_app/feature/nav_bar/view_model/nav_bar_cubit.dart';
import 'package:e_commerce_app/feature/splash_screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return RouterTransitions.build(SplashPage());
      case Routes.startRoute:
        return RouterTransitions.build(StartPage());
      case Routes.homeDetilsRoute:
        final productId = settings.arguments as String;

        return RouterTransitions.build(
          BlocProvider(
            create: (context) => getIt<ProductIdCubit>()..getProduct(productId),
            child: HomeDetilsPage(productId: productId),
          ),
        );
      case Routes.reviewRoute:
        return RouterTransitions.build(ReviewPage());
      case Routes.navBarRoute:
        return RouterTransitions.build(
          BlocProvider(create: (context) => NavBarCubit(), child: NavBarPage()),
        );
      case Routes.homeRoute:
        return RouterTransitions.build(HomePage());
      case Routes.loginRoute:
        return RouterTransitions.buildHorizontal(
          BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginPage(),
          ),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: RegisterPage(),
          ),
        );
      case Routes.verifyEmailRoute:
        final firstName = settings.arguments as String;
        return RouterTransitions.buildHorizontal(
          BlocProvider(
            create: (context) => getIt<VerifyEmailCubit>(),
            child: VerifyEmailPage(firstName: firstName),
          ),
        );
      default:
        return RouterTransitions.build(
          Scaffold(body: Center(child: Text("No Route"))),
        );
    }
  }
}
