import 'package:flutter/material.dart';

// Paleta de Colores Primaria
const Color primaryColorRed = Color(0xFFED193E);
const Color primaryColorBlue = Color(0xFF142449);

// Paleta de Colores Secundaria
const Color secondaryColorGrey = Color(0xFFE5E1E5);
const Color secondaryColorWine = Color(0xFFC41F4B);
const Color secondaryColorOrange = Color(0xFFF04B24);
const Color secondaryColorOxfordBlue = Color(0xFF12284B);
const Color secondaryColorBlueGrey = Color(0xFF415364);

// Tipografías
const String primaryFontFamily = 'SohoGothicPro';
const String secondaryFontFamily = 'Cairo';

// Estilos de texto
TextStyle primaryTextTitleStyle = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.bold,
  fontSize: 24,
);

TextStyle primaryTextSubtitleStyle = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.normal,
  fontSize: 16,
);

final TextStyle buttonTextSecondaryStyle = TextStyle(
  fontFamily: 'SohoGothicPro',
  fontSize: 18,
);
final TextStyle buttonTextPrimaryStyle = TextStyle(
  fontFamily: 'SohoGothicPro',
  fontSize: 18,
);

TextStyle primaryTextBodyStyle = TextStyle(
  fontFamily: primaryFontFamily,
  fontWeight: FontWeight.normal,
  fontSize: 16,
);

TextStyle secondaryTextTitleStyle = TextStyle(
  fontFamily: secondaryFontFamily,
  fontWeight: FontWeight.bold,
  fontSize: 24,
);

TextStyle secondaryTextBodyStyle = TextStyle(
  fontFamily: secondaryFontFamily,
  fontWeight: FontWeight.normal,
  fontSize: 16,
);

// Tema
ThemeData appTheme() {
  return ThemeData(
    primaryColor: primaryColorBlue,
    accentColor: primaryColorRed,
    backgroundColor: secondaryColorGrey,
    disabledColor: secondaryColorBlueGrey,
    errorColor: secondaryColorOrange,
    indicatorColor: secondaryColorOxfordBlue,
    hintColor: secondaryColorBlueGrey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: secondaryFontFamily,
    textTheme: TextTheme(
      headline1: primaryTextTitleStyle,
      bodyText1: primaryTextBodyStyle,
      headline2: secondaryTextTitleStyle,
      bodyText2: secondaryTextBodyStyle,
      // Estilos adicionales
      subtitle1: TextStyle(fontFamily: 'Cairo-Bold'),
      subtitle2: TextStyle(fontFamily: 'Cairo-Bold'),
      button: TextStyle(fontFamily: 'Cairo-Bold'),
      caption: TextStyle(fontFamily: 'Cairo-Regular'),
      overline: TextStyle(fontFamily: 'Cairo-Regular'),
    ),
  );
}
