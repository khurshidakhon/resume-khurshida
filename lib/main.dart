import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/resume_screen.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatefulWidget {
  const ResumeApp({super.key});

  @override
  State<ResumeApp> createState() => _ResumeAppState();
}

class _ResumeAppState extends State<ResumeApp> {
  bool _isRussian = false;

  void _toggleLanguage() => setState(() => _isRussian = !_isRussian);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khurshida Toshbekova — Resume',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: ResumeScreen(
        isRussian: _isRussian,
        onToggleLanguage: _toggleLanguage,
      ),
    );
  }
}
