// lib/core/components/job_card.dart

import 'package:flutter/material.dart';
import 'package:interview_app/core/constants/color.dart'; // Ensure correct import path

class JobCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final VoidCallback onTap;

  JobCard({
    required this.title,
    required this.description,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: basarsoft_color_light.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(Icons.assignment_turned_in, color: basarsoft_color), // Icon indicating action
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: basarsoft_color,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              date,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: basarsoft_color), // Icon indicating navigation
        onTap: onTap,
      ),
    );
  }
}
