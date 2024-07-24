import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool agreePersonalData = false;

  void toggleAgreePersonalData(bool value) {
    agreePersonalData = value;
    notifyListeners();
  }

  void handleSignUp(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      // Implement your sign-up logic here
      // You can use a service locator or any other dependency injection mechanism to get your AuthService
      // locator.get<AuthService>().signUp(...);
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
