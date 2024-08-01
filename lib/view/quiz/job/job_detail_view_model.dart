import 'package:flutter/material.dart';

import 'package:interview_app/view/quiz/quiz/quiz_view.dart';
class JobDetailsViewModel extends ChangeNotifier {
  final String departmentName;

  JobDetailsViewModel(this.departmentName);

  // AppBar properties
  String get appBarTitle => '$departmentName İş İlanları';
  Color get appBarBackgroundColor => Colors.blue; // Use your theme color here

  void onBackPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onSearchPressed() {
    // Implement search functionality here if needed
  }

  onLogoutPressed() {
    // Implement logout functionality here
  }


  void navigateToQuiz(BuildContext context, String jobTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizView(jobTitle: jobTitle),
      ),
    );
  }
}
