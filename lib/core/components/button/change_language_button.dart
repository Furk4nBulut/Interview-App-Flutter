import 'package:flutter/material.dart';
import 'package:interview_app/core/extension/string_extension.dart';
import '../../localization/locale_keys.g.dart';
import 'custom_country_flag_button.dart'; // Import the custom flag widget

class ChangeLanguageButton extends StatelessWidget {
  final String languageCode;
  final VoidCallback onPressed;

  const ChangeLanguageButton({
    required this.languageCode,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
      LocaleKeys.welcome_view_change_language.locale,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        IconButton(
          icon: CustomCountryFlag(
            languageCode: languageCode,
            width: 40.0, // Customize the size
            height: 30.0,
            borderColor: Colors.grey, // Customize the border
            borderWidth: 1.0,
            boxShadow: BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(2, 2),
              blurRadius: 4,
            ), // Customize the shadow
          ),
          onPressed: onPressed,
          iconSize: 40.0, // Set this to match the size of CustomCountryFlag
        ),
      ],
    );
  }
}
