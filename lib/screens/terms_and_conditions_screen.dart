import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(title: 'Términos y Condiciones'),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionTitle('1. Introducción', appTheme),
              buildSectionText(
                'Estos Términos y Condiciones rigen el uso de nuestra aplicación y todos los servicios relacionados. Al utilizar nuestra aplicación, usted acepta estos Términos y Condiciones en su totalidad. Si no está de acuerdo con estos Términos y Condiciones o cualquier parte de estos Términos y Condiciones, no debe utilizar nuestra aplicación.',
                appTheme,
              ),
              // Añade más secciones y texto aquí
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title, ThemeData appTheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style:
            appTheme.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildSectionText(String text, ThemeData appTheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: appTheme.textTheme.bodyText1,
      ),
    );
  }
}
