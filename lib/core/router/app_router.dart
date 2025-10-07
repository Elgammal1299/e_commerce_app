import 'package:e_commerce_app/core/DI/setup_get_it.dart';
import 'package:e_commerce_app/core/router/router_transitions.dart';
import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/feature/auth/login/ui/view/start_page.dart';
import 'package:e_commerce_app/feature/auth/login/ui/view/login_page.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view/register_page.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view/verify_email_page.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view_model/register_cubit/register_cubit.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view_model/verify_email_cubit/verify_email_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startRoute:
        return RouterTransitions.build(StartPage());
      case Routes.loginRoute:
        return RouterTransitions.build(LoginPage());
      case Routes.homeRoute:
        return RouterTransitions.buildHorizontal(LoginPage());
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
