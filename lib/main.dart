import 'package:flutter/material.dart';
import 'package:growing/app/theme/app_theme.dart';
import 'package:growing/app/screens/onboard/welcome_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'growing',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const WelcomeScreen(),
    );
  }
}
