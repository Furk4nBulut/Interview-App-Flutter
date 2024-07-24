import 'package:flutter/material.dart';
import 'package:interview_app/view/authenticate/splash/splash_view.dart';
import 'package:interview_app/view/authenticate/splash/splash_view_model.dart';
import 'package:provider/provider.dart';
import 'package:interview_app/view/authenticate/welcome/welcome_view.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          '/welcome': (context) => WelcomeView(), // Define your HomeScreen widget
          '/splash': (context) => SplashScreen(), // Define your SplashScreen widget
        },
      ),
    );
  }
}