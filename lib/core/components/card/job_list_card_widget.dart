import 'package:flutter/material.dart';
import 'package:interview_app/core/constants/color.dart';
import 'package:flutter/material.dart';

class JobListingCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String date;
  final int openPositions;
  final VoidCallback onDetailsPressed;

  JobListingCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.date,
    required this.openPositions,
    required this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: basarsoft_color, width: 1),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 40.0,
                  color: basarsoft_color,
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: basarsoft_color,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        description,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tarih: $date',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Açık Pozisyon: $openPositions',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: onDetailsPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: basarsoft_color, // background
                    foregroundColor: Colors.white, // foreground
                  ),
                  child: Text('Detaylar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
