import 'package:flutter/material.dart';
import 'package:slylist_app/screens/login_screen.dart';
import 'theme.dart'; // Importar theme.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro',
      theme: appTheme(), // Utilizar el tema definido en theme.dart
      home: LoginScreen(),
    );
  }
}
