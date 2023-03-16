import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Recuperar contraseña'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _isEmailValid = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(fontFamily: 'Cairo-Regular'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isEmailValid
                    ? () {
                        // Aquí va el código para enviar la solicitud de restablecimiento de contraseña
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFED193E),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(
                    fontFamily: 'SohoGothicPro-Bold',
                    fontSize: 18,
                  ),
                ),
                child: Text('Enviar'),
              ),
              SizedBox(height: 20),
              Text(
                'Se ha enviado un correo electrónico de restablecimiento de contraseña a la dirección proporcionada. Por favor, sigue las instrucciones en el correo electrónico para restablecer tu contraseña.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Cairo-Regular'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    fontFamily: 'Cairo-Bold',
                    color: Color(0xFFED193E),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
