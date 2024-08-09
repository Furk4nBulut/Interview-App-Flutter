import 'package:flutter/material.dart';
import 'package:interview_app/core/constants/navigation_constants.dart';
import 'package:interview_app/core/extension/string_extension.dart';
import 'package:interview_app/core/localization/locale_keys.g.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(LocaleKeys.login_view_model_login_process.locale)),
    );

    // Simulate login logic
    await Future.delayed(const Duration(seconds: 2)); // Simulating network call

    // After login, navigate to home screen
    Navigator.pushReplacementNamed(context, NavigationConstants.HOME);

    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
