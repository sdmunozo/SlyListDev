import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Colores primarios
  static const Color primaryRed = Color(0xFFED193E);
  static const Color primaryNavyBlue = Color(0xFF142431);

  // Colores secundarios
  static const Color secondaryLightGray = Color(0xFFE5E1E5);
  static const Color secondaryWine = Color(0xFFC41F4B);
  static const Color secondaryOrange = Color(0xFFF04B24);
  static const Color secondaryOxfordBlue = Color(0xFF12284B);
  static const Color secondaryBlueGray = Color(0xFF415364);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryRed,
    accentColor: primaryNavyBlue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: _buildTextTheme(),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryRed,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryRed,
        textStyle: TextStyle(fontFamily: 'Cairo-Bold'),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primaryRed,
        textStyle: TextStyle(fontFamily: 'Cairo-Bold'),
      ),
    ),
  );

  static TextTheme _buildTextTheme() {
    return const TextTheme(
      headline1: TextStyle(fontFamily: 'SohoGothicPro-Ultra', fontSize: 96),
      headline2: TextStyle(fontFamily: 'SohoGothicPro-Ultra', fontSize: 60),
      headline3: TextStyle(fontFamily: 'SohoGothicPro-Bold', fontSize: 48),
      headline4: TextStyle(fontFamily: 'SohoGothicPro-Bold', fontSize: 34),
      headline5: TextStyle(fontFamily: 'SohoGothicPro-Bold', fontSize: 24),
      headline6: TextStyle(fontFamily: 'SohoGothicPro-Bold', fontSize: 20),
      subtitle1: TextStyle(fontFamily: 'Cairo-Bold', fontSize: 16),
      subtitle2: TextStyle(fontFamily: 'Cairo-Regular', fontSize: 14),
      bodyText1: TextStyle(fontFamily: 'Cairo-Regular', fontSize: 16),
      bodyText2: TextStyle(fontFamily: 'Cairo-Regular', fontSize: 14),
      button: TextStyle(fontFamily: 'Cairo-Bold', fontSize: 14),
      caption: TextStyle(fontFamily: 'Cairo-Regular', fontSize: 12),
      overline: TextStyle(fontFamily: 'Cairo-Regular', fontSize: 10),
    );
  }

  static ThemeData get light => lightTheme;
}
