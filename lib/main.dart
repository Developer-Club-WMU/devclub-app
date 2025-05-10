import 'package:flutter/material.dart';
import 'package:devclub_app/theme.dart';
import 'package:devclub_app/home.dart';
void main() {
  runApp(const DevClubApp());
}

class DevClubApp extends StatelessWidget {
  const DevClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Developer Club App',
      theme: AppTheme.light, // form 'theme.dart'
      darkTheme: AppTheme.dark, // from 'theme.dart'
      themeMode: ThemeMode.system, // Use the OS current theme mode
      home: const HomePage(),
    );
  }
}