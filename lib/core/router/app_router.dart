import 'package:e_commerce_app/core/router/router_transitions.dart';
import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/feature/auth/login/ui/view/start_page.dart';
import 'package:e_commerce_app/feature/auth/login/ui/view/login_page.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view/register_page.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view/verify_email_page.dart';
import 'package:flutter/material.dart';

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
        return RouterTransitions.buildHorizontal(RegisterPage());
      case Routes.verifyEmailRoute:
        return RouterTransitions.buildHorizontal(VerifyEmailPage());
      default:
        return RouterTransitions.build(
          Scaffold(body: Center(child: Text("No Route"))),
        );
    }
  }
}
