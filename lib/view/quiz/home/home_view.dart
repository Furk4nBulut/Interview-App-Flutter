import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_app/view/quiz/home/home_view_model.dart';
import 'package:interview_app/core/constants/color.dart'; // Ensure you have the basarsoft_color defined in this file
import 'package:interview_app/core/components/card/job_list_card_widget.dart';
import 'package:interview_app/core/components/bar/appbar.dart'; // Ensure the import path is correct


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: CustomAppBar(
              title: viewModel.appBarTitle,
              onBackPressed: () => viewModel.onBackPressed(context),
              onLogoutPressed: () => viewModel.onLogoutPressed(context),
              onSearchPressed: viewModel.onSearchPressed,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Açık İlanlar',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: basarsoft_color,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Use ListView.builder for better performance with dynamic lists
                  ListView.builder(
                    shrinkWrap: true, // Allows ListView to take only needed space
                    itemCount: viewModel.jobListings.length,
                    itemBuilder: (context, index) {
                      var job = viewModel.jobListings[index];
                      return JobListingCard(
                        title: job['title'],
                        description: job['description'],
                        icon: job['icon'],
                        date: job['date'],
                        openPositions: job['openPositions'],
                        onDetailsPressed: () {
                          viewModel.navigateToJobDetails(
                            context,
                            job['title'],
                          );
                        },
                      );
                    },
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
