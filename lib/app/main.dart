import 'package:flutter/material.dart';
import 'package:slylist_app/screens/login_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro',
      theme: AppTheme.lightTheme,
      home: LoginScreen(),
    );
  }
}
