import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:interview_app/view/authenticate/login/login_view.dart';
import 'package:interview_app/view/authenticate/register/register_view.dart';

class WelcomeViewModel extends ChangeNotifier {
  void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
    );
  }

  void navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterView()),
    );
  }
  void toggleLanguage(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode;
    final newLocale = currentLocale == 'en' ? const Locale('tr', 'TR') : const Locale('en', 'US');
    context.setLocale(newLocale);
    notifyListeners();
  }


  Widget getCountryFlag(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    return CountryFlag.fromLanguageCode(languageCode);
  }
}
