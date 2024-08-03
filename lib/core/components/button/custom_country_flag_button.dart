import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class CustomCountryFlag extends StatelessWidget {
  final String languageCode;
  final double width;
  final double height;
  final Color borderColor;
  final double borderWidth;
  final BoxShadow boxShadow;

  const CustomCountryFlag({
    required this.languageCode,
    this.width = 32.0,
    this.height = 24.0,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.boxShadow = const BoxShadow(
      color: Colors.transparent,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        boxShadow: [boxShadow],
      ),
      child: CountryFlag.fromLanguageCode(
        languageCode,
      ),
    );
  }
}
