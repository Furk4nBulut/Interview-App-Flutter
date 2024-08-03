import 'package:flutter/material.dart';
class ApplicationConstants {
  static const LANGUAGE_ASSETS_PATH = "assets/localization";
  // flutter pub run easy_localization:generate -o lib/core/localization -f keys -o locale_keys.g.dart -S assets/localization -O lib/core/localization/
  // cd scripts/language

  static const SUPPORTED_LOCALE = [
    ApplicationConstants.EN_LOCALE,
    ApplicationConstants.TR_LOCALE
  ];

  static const TR_LOCALE = Locale("tr", "TR");
  static const EN_LOCALE = Locale("en", "US");
}