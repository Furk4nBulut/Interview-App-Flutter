import 'package:flutter/material.dart';
import 'package:interview_app/core/extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  final String value;

  const LocaleText({required Key key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      value.locale,
    );
  }
}