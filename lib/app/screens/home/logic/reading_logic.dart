import 'package:flutter/material.dart';

class Readometer extends StatefulWidget {
  const Readometer({super.key});

  @override
  State<Readometer> createState() => _ReadometerState();
}

class _ReadometerState extends State<Readometer> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "27min",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            // fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "of 60min",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
