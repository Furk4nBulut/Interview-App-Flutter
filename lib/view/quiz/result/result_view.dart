// lib/view/quiz/result_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_app/core/components/bar/appbar.dart'; // Ensure correct import path
import 'package:interview_app/core/constants/color.dart'; // Ensure correct import path
import 'package:interview_app/view/quiz/result/result_view_model.dart'; // Ensure correct import path

class ResultView extends StatelessWidget {
  final bool isSuccess; // Determine success or failure

  ResultView({required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ResultViewModel(
        isSuccess: isSuccess,
        context: context,
      ),
      child: Consumer<ResultViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Quiz Results',
              onBackPressed: () {
                viewModel.navigateToHome(); // Use ViewModel for navigation
              },
              onSearchPressed: () {},
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      viewModel.isSuccess ? Icons.check_circle : Icons.cancel,
                      size: 80.0,
                      color: viewModel.isSuccess ? Colors.green : Colors.red,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      viewModel.isSuccess
                          ? 'Congratulations! You passed the quiz.'
                          : 'Sorry, you did not pass the quiz.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: viewModel.isSuccess ? Colors.green : Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.navigateToHome(); // Use ViewModel for navigation
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: basarsoft_color, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                      ),
                      child: Text(
                        'Back to Home',
                        style: TextStyle(color: Colors.white, fontSize: 16.0), // Text color and size
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
