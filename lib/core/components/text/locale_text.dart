import 'package:flutter/material.dart';
import 'package:interview_app/core/extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  final String text;

  const LocaleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.locale,
    );
  }
}