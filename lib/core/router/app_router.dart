import 'package:e_commerce_app/core/router/router_transitions.dart';
import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/feature/login_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case Routes.login:
        return RouterTransitions.build(LoginView());
      case Routes.home:
      return RouterTransitions.buildHorizontal(LoginView());  
      default: return RouterTransitions.build(Scaffold(
        body:Center(
          child: Text("No Route"),
        ),
      ));
    }
  }
}