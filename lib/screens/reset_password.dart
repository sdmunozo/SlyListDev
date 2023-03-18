import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/theme.dart';
import 'package:slylist_app/widgets/large_button_widget.dart';
import 'package:slylist_app/widgets/text_form_field_widget.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              TextFormFieldWidget(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _isEmailValid = value.isNotEmpty;
                  });
                },
                labelText: 'Correo electrónico',
              ),
              const SizedBox(height: 20),
              LargeButtonWidget(
                  onPressed: _isEmailValid ? () {} : null,
                  buttonText: 'Enviar'),
              const SizedBox(height: 20),
              Text(
                'Se ha enviado un correo electrónico de restablecimiento de contraseña a la dirección proporcionada. Por favor, sigue las instrucciones en el correo electrónico para restablecer tu contraseña.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Cairo-Regular'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    fontFamily: 'Cairo-Bold',
                    color: AppTheme.primaryNavyBlue,
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
