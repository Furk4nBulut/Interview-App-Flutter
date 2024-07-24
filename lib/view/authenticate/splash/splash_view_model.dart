import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  // Flag to track if the widget is still mounted
  bool _isMounted = true;

  // Add any logic for the splash screen, such as navigation after a delay
  void navigateToHome(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));

    // Check if the widget is still mounted before navigating
    if (_isMounted) {
      Navigator.pushReplacementNamed(context, '/welcome');
    }
  }

  // Call this method to indicate that the widget is no longer mounted
  void dispose() {
    _isMounted = false;
    super.dispose();
  }
}
