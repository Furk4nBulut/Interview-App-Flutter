import 'package:flutter/material.dart';
import 'package:interview_app/core/constants/navigation_constants.dart';

import '../../view/authenticate/login/login_view.dart';
import '../../view/authenticate/register/register_view.dart';
import '../../view/authenticate/splash/splash_view.dart';
import '../../view/authenticate/welcome/welcome_view.dart';
import '../components/card/not_found_navigation_widget.dart';
import '../../view/quiz/home/home_view.dart';
import '../../view/quiz/job/job_detail_view.dart';
import '../../view/quiz/quiz/quiz_view.dart';
import '../../view/quiz/result/result_view.dart';


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

      case NavigationConstants.HOME: // Add this case
        return normalNavigate(HomeView());
      case NavigationConstants.JOB_DETAIL: // Add this case
        final departmentName = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => JobDetailsView(departmentName: departmentName ?? ''),
        );
        case NavigationConstants.QUIZ: // Add this case
        final jobTitle = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => QuizView(jobTitle: jobTitle ?? ''),
        );
        
        case NavigationConstants.RESULT: // Add this case
        return MaterialPageRoute(
          builder: (context) => ResultView(isSuccess: false,),
        );


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
