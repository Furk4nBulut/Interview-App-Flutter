
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch the view model and initiate navigation
    Provider.of<SplashViewModel>(context, listen: false).navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash/splashscreen.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
