// lib/view/quiz/result/result_view_model.dart

import 'package:flutter/material.dart';
import 'package:interview_app/view/quiz/home/home_view.dart';

class ResultViewModel extends ChangeNotifier {
  final bool isSuccess;
  final BuildContext context;

  ResultViewModel({required this.isSuccess, required this.context});

  void navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }
}
