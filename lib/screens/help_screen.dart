import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/widgets/large_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': '¿Cómo puedo registrarme en la aplicación?',
      'answer':
          'Para registrarte, haz clic en el botón "Registrarse" en la pantalla de inicio y sigue las instrucciones.',
    },
    {
      'question': '¿Cómo puedo cambiar mi dirección de correo electrónico?',
      'answer':
          'Ve a la sección "Mi cuenta" en la aplicación y selecciona "Cambiar dirección de correo electrónico".',
    },
// Agrega más preguntas y respuestas aquí
  ];

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.light;
    final callButtonStyle = ElevatedButton.styleFrom(
      primary: AppTheme.primaryNavyBlue,
      padding: EdgeInsets.symmetric(vertical: 16),
      textStyle: TextStyle(fontSize: 20),
    );
    return Scaffold(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      appBar: CustomAppBar(title: 'Ayuda'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: faqs.length,
                itemBuilder: (BuildContext context, int index) {
                  return FAQWidget(
                    question: faqs[index]['question']!,
                    answer: faqs[index]['answer']!,
                    appTheme: appTheme,
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            Text(
              '¿Necesitas más ayuda?',
              style: appTheme.textTheme.subtitle1
                  ?.copyWith(color: AppTheme.primaryRed, fontSize: 24),
            ),
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: LargeButtonWidget(
                      onPressed: () {
                        _launchURL(
                            'tel:+1234567890'); // Reemplaza con el número de teléfono real
                      },
                      buttonText: 'Llamar',
                      fontSize: 20,
                      colorOption: ButtonColorOption.option2,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: LargeButtonWidget(
                      onPressed: () {
                        _launchURL(
                            'https://wa.me/1234567890'); // Reemplaza con el número de teléfono real
                      },
                      buttonText: 'WhatsApp',
                      fontSize: 20,
                      colorOption: ButtonColorOption.option2,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class FAQWidget extends StatelessWidget {
  final String question;
  final String answer;
  final ThemeData appTheme;

  FAQWidget(
      {required this.question, required this.answer, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(accentColor: AppTheme.primaryNavyBlue),
      child: ExpansionTile(
        title: Text(
          question,
          style: appTheme.textTheme.subtitle1?.copyWith(
            color: AppTheme.primaryRed,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              answer,
              style: appTheme.textTheme.bodyText2?.copyWith(
                color: AppTheme.primaryNavyBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
