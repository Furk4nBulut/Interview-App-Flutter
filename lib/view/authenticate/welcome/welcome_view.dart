import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:interview_app/core/components/button/change_language_button.dart';
import 'package:interview_app/core/constants/color.dart';
import 'package:interview_app/core/constants/image_path_constants.dart';
import 'package:interview_app/core/extension/string_extension.dart';
import 'package:interview_app/core/localization/locale_keys.g.dart';
import 'package:interview_app/view/authenticate/login/login_view.dart';
import 'package:interview_app/view/authenticate/register/register_view.dart';
import 'package:interview_app/core/components/button/welcome_button.dart';
import 'package:interview_app/core/constants/color.dart';
import 'package:interview_app/view/authenticate/welcome/welcome_view_model.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          ChangeLanguageButton(
            languageCode: Localizations.localeOf(context).languageCode,
            onPressed: () {
              WelcomeViewModel().toggleLanguage(context);
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            ImagePathConstants.welcomeImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                Flexible(
                  flex: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 40.0,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 485.0),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: LocaleKeys.welcome_view_welcome_title.locale,
                                  style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w900,
                                    color: basarsoft_color,
                                    shadows: [
                                      Shadow(
                                        color: Colors.white.withOpacity(0.3),
                                        offset: Offset(2, 2),
                                        blurRadius: 3,
                                      ),
                                    ],
                                  ),
                                ),
                                TextSpan(
                                  text: '\n${LocaleKeys.welcome_view_welcome_subtitle.locale}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: basarsoft_color.withOpacity(0.3),
                                        offset: Offset(2, 2),
                                        blurRadius: 3,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        Expanded(
                          child: WelcomeButton(
                            buttonText: 'Giriş Yap',
                            onTap: () {
                             WelcomeViewModel().navigateToLogin(context);
                            },
                            color: Colors.transparent,
                            textColor: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: WelcomeButton(
                            buttonText: 'Kayıt Ol',
                            onTap: () {
                              WelcomeViewModel().navigateToRegister(context);
                            },
                            color: Colors.white,
                            textColor: basarsoft_color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
