import 'package:flutter/material.dart';
import 'package:interview_app/core/constants/navigation_constants.dart';

import '../../view/authenticate/login/login_view.dart';
import '../../view/authenticate/register/register_view.dart';
import '../../view/authenticate/splash/splash_view.dart';
import '../../view/authenticate/welcome/welcome_view.dart';
import '../components/card/not_found_navigation_widget.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {



      case NavigationConstants.SPLASH:
        return normalNavigate(SplashScreen());

      case NavigationConstants.WELCOME:
        return normalNavigate(WelcomeView());

      case NavigationConstants.LOGIN:
        return normalNavigate(LoginView());

       case NavigationConstants.REGISTER:
        return normalNavigate(RegisterView());




      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
