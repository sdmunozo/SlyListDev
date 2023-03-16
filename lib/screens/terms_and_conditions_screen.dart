// lib/screens/terms_and_conditions_screen.dart
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Términos y Condiciones'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. Introducción',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Estos Términos y Condiciones rigen el uso de nuestra aplicación y todos los servicios relacionados. Al utilizar nuestra aplicación, usted acepta estos Términos y Condiciones en su totalidad. Si no está de acuerdo con estos Términos y Condiciones o cualquier parte de estos Términos y Condiciones, no debe utilizar nuestra aplicación.',
                style: TextStyle(fontSize: 16),
              ),
              // Añade más secciones y texto aquí
            ],
          ),
        ),
      ),
    );
  }
}
