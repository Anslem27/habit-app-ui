import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final Color headerColor;
  const AppHeader({super.key, required this.title, required this.headerColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style:  TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: headerColor,
        ),
      ),
    );
  }
}
