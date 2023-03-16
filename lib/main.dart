import 'package:flutter/material.dart';
import 'package:slylist_app/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Paleta de colores primaria
    Color primaryColorRed = Color(0xFFED193E);
    Color primaryColorBlue = Color(0xFF142449);

    // Paleta de colores secundaria
    Color secondaryColorGrey = Color(0xFFE5E1E5);
    Color secondaryColorWine = Color(0xFFC41F4B);
    Color secondaryColorOrange = Color(0xFFF04B24);
    Color secondaryColorOxfordBlue = Color(0xFF12284B);
    Color secondaryColorBlueGrey = Color(0xFF415364);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro',
      theme: ThemeData(
        primaryColor: primaryColorBlue,
        accentColor: primaryColorRed,
        backgroundColor: secondaryColorGrey,
        disabledColor: secondaryColorWine,
        errorColor: secondaryColorOrange,
        indicatorColor: secondaryColorOxfordBlue,
        hintColor: secondaryColorBlueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Cairo',
        textTheme: TextTheme(
          headline1: TextStyle(fontFamily: 'SohoGothicPro-Bold'),
          headline2: TextStyle(fontFamily: 'SohoGothicPro-Bold'),
          headline3: TextStyle(fontFamily: 'SohoGothicPro-Bold'),
          headline4: TextStyle(fontFamily: 'SohoGothicPro-Bold'),
          headline5: TextStyle(fontFamily: 'SohoGothicPro-Bold'),
          headline6: TextStyle(fontFamily: 'SohoGothicPro-Bold'),
          subtitle1: TextStyle(fontFamily: 'Cairo-Bold'),
          subtitle2: TextStyle(fontFamily: 'Cairo-Bold'),
          bodyText1: TextStyle(fontFamily: 'Cairo-Regular'),
          bodyText2: TextStyle(fontFamily: 'Cairo-Regular'),
          button: TextStyle(fontFamily: 'Cairo-Bold'),
          caption: TextStyle(fontFamily: 'Cairo-Regular'),
          overline: TextStyle(fontFamily: 'Cairo-Regular'),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
