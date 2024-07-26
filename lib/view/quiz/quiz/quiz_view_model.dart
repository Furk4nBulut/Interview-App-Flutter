// lib/view/quiz/quiz/quiz_view_model.dart

import 'package:flutter/material.dart';

class QuizViewModel extends ChangeNotifier {
  final String jobTitle;
  final List<Map<String, dynamic>> _questions;
  int _currentQuestionIndex = 0;
  // Track user answers
  final Map<int, String> _userAnswers = {};

  QuizViewModel(this.jobTitle)
      : _questions = [
    {'question': 'What is Flutter?', 'options': ['A framework', 'A library', 'A tool', 'None of the above']},
    {'question': 'What language is used in Flutter?', 'options': ['Java', 'Dart', 'Swift', 'JavaScript']},
    // Add more questions here
  ];

  List<Map<String, dynamic>> get questions => _questions;
  Map<String, dynamic> get currentQuestion => _questions[_currentQuestionIndex];
  String get appBarTitle => 'Quiz: $jobTitle';

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    } else {
      // Quiz finished, navigate to result screen
      notifyListeners();
      _navigateToResultScreen();
    }
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  void onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void onSearchPressed() {
    // Implement search functionality if needed
  }

  bool get isQuizFinished => _currentQuestionIndex == _questions.length - 1;

  void _navigateToResultScreen() {
    // Navigate to result screen
    // Here you could also calculate scores and pass them to the result screen
  }

  // Example method to handle an option selection
  void handleOptionSelection(String selectedOption) {
    _userAnswers[_currentQuestionIndex] = selectedOption;
    notifyListeners();
  }
}
