import 'package:flutter/material.dart';
import 'package:interview_app/core/constants/app/app_constants.dart';
import 'package:interview_app/core/provider/provider_list.dart';
import 'package:interview_app/view/authenticate/splash/splash_view.dart';
import 'package:interview_app/view/authenticate/splash/splash_view_model.dart';
import 'package:provider/provider.dart';
import 'package:interview_app/view/authenticate/welcome/welcome_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:interview_app/core/localization/localization_manager.dart';

import 'core/provider/theme_notifier.dart';
import 'core/routing/navigation_route.dart';
import 'core/service/NavigationService.dart';

void main() {
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: LanguageManager.instance.supportedLocales,
    path: ApplicationConstants.LANGUAGE_ASSETS_PATH,

  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...ApplicationProvider.instance.dependItems,


        ChangeNotifierProvider(create: (_) => SplashViewModel()),
      ],
      child: MaterialApp(
        theme: Provider.of<ThemeNotifier>(context,listen: false).currentTheme,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
      ),
    );
  }
}