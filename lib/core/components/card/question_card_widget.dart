// lib/core/components/card/question_card_widget.dart

import 'package:flutter/material.dart';
import 'package:interview_app/core/constants/color.dart'; // Ensure correct import path

class QuestionCard extends StatefulWidget {
  final String questionText;
  final List<String> options;
  final ValueChanged<String> onOptionSelected;

  QuestionCard({
    required this.questionText,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  String? _selectedOption;

  void _handleOptionSelected(String option) {
    setState(() {
      _selectedOption = option;
    });
    widget.onOptionSelected(option);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.questionText,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: basarsoft_color, // Primary color
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.options.map((option) {
                return OptionTile(
                  optionText: option,
                  isSelected: _selectedOption == option,
                  onTap: () => _handleOptionSelected(option),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final String optionText;
  final bool isSelected;
  final VoidCallback onTap;

  OptionTile({
    required this.optionText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.0),
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? basarsoft_color_light : Colors.transparent,
                border: Border.all(
                  color: basarsoft_color, // Border color
                  width: 2.0,
                ),
              ),
              child: isSelected
                  ? Icon(
                Icons.check,
                size: 16.0,
                color: basarsoft_color,
              )
                  : null,
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Text(
                optionText,
                style: TextStyle(
                  fontSize: 16.0,
                  color: basarsoft_color, // Text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
