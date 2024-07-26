// lib/core/components/custom_app_bar.dart

import 'package:flutter/material.dart';
import 'package:interview_app/core/constants/color.dart'; // Ensure you have the basarsoft_color defined in this file

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onLogoutPressed;

  CustomAppBar({
    required this.title,
    this.onBackPressed,
    this.onSearchPressed,
    this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: basarsoft_color,
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      leading: onBackPressed != null
          ? IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: onBackPressed,
      )
          : null,
      actions: [
        if (onSearchPressed != null)
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: onSearchPressed,
          ),
        if (onLogoutPressed != null)
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.white,
            onPressed: onLogoutPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
