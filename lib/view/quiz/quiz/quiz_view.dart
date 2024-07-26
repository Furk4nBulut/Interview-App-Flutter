// lib/view/quiz/quiz_view.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_app/core/components/bar/appbar.dart'; // Ensure correct import path
import 'package:interview_app/view/quiz/quiz/quiz_view_model.dart'; // Ensure correct import path
import 'package:interview_app/core/components/card/question_card_widget.dart'; // Ensure correct import path
import 'package:interview_app/core/constants/color.dart'; // Ensure correct import path
import 'package:interview_app/view/quiz/result/result_view.dart'; // Ensure correct import path

class QuizView extends StatelessWidget {
  final String jobTitle;

  QuizView({required this.jobTitle});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizViewModel(jobTitle),
      child: Consumer<QuizViewModel>(
        builder: (context, viewModel, child) {
          final question = viewModel.currentQuestion;
          final totalQuestions = viewModel.questions.length;
          final currentIndex = viewModel.questions.indexOf(question) + 1;

          return Scaffold(
            appBar: CustomAppBar(
              title: viewModel.appBarTitle,
              onBackPressed: () => viewModel.onBackPressed(context),
              onSearchPressed: viewModel.onSearchPressed,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearProgressIndicator(
                        value: currentIndex / totalQuestions,
                        color: basarsoft_color_light,
                        backgroundColor: Colors.grey.shade300, // Light grey background
                      ),
                      SizedBox(height: 8.0), // Space between progress indicator and text
                      Text(
                        'Question $currentIndex of $totalQuestions',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: basarsoft_color, // Text color
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: QuestionCard(
                      questionText: question['question'],
                      options: question['options'],
                      onOptionSelected: (selectedOption) {
                        viewModel.handleOptionSelection(selectedOption);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (viewModel.currentQuestion != viewModel.questions.first)
                        ElevatedButton(
                          onPressed: () => viewModel.previousQuestion(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: basarsoft_color, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                          ),
                          child: Text(
                            'Previous',
                            style: TextStyle(color: Colors.white), // Text color
                          ),
                        ),
                      ElevatedButton(
                        onPressed: () {
                          if (viewModel.isQuizFinished) {
                            // Navigate to result screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultView(
                                  isSuccess: _calculateSuccess(viewModel), // Implement success calculation logic
                                ),
                              ),
                            );
                          } else {
                            viewModel.nextQuestion();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: basarsoft_color, // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        ),
                        child: Text(
                          viewModel.isQuizFinished ? 'Finish' : 'Next',
                          style: TextStyle(color: Colors.white), // Text color
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _calculateSuccess(QuizViewModel viewModel) {
    // Implement logic to calculate success or failure
    // For example, compare user answers with correct answers
    return true; // Example result, replace with actual logic
  }
}
