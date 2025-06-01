import 'package:flutter/material.dart';
import 'package:smtp_email/pages/home_page.dart';
import 'package:smtp_email/themedata/theme_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage());
  }
}
