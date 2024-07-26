import 'package:flutter/material.dart';
import 'package:interview_app/core/constants/color.dart';
import 'package:provider/provider.dart';
import 'package:interview_app/view/quiz/job/job_detail_view_model.dart'; // Ensure correct import path
import 'package:interview_app/core/components/bar/appbar.dart'; // Ensure correct import path
import 'package:interview_app/core/components/card/job_quiz_card_widget.dart'; // Ensure correct import path

class JobDetailsView extends StatelessWidget {
  final String departmentName;

  JobDetailsView({required this.departmentName});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JobDetailsViewModel(departmentName),
      child: Consumer<JobDetailsViewModel>(
        builder: (context, viewModel, child) {
          final List<Map<String, String>> jobListings = [
            {
              'title': 'Junior Developer',
              'description': 'Entry-level position for junior developers.',
              'date': '01.07.2024'
            },
            {
              'title': 'Senior Developer',
              'description': 'Experienced developer with 5+ years of experience.',
              'date': '01.07.2024'
            },
            // Add more listings as needed
          ];

          return Scaffold(
            appBar: CustomAppBar(
              title: viewModel.appBarTitle,
              onBackPressed: () => viewModel.onBackPressed(context),
              onSearchPressed: viewModel.onSearchPressed,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Mevcut Açık Pozisyonlar',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: basarsoft_color, // Use your defined color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16.0), // Space between header and list
                  Expanded(
                    child: ListView.builder(
                      itemCount: jobListings.length,
                      itemBuilder: (context, index) {
                        final job = jobListings[index];
                        return JobCard(
                          title: job['title'] ?? 'No Title',
                          description: job['description'] ?? 'No Description',
                          date: job['date'] ?? 'No Date',
                          onTap: () {
                            viewModel.navigateToQuiz(context, job['title'] ?? 'No Title');
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
