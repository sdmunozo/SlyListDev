import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/checkbox_widget.dart';
import 'package:slylist_app/widgets/large_button_widget.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/theme.dart';
import 'package:slylist_app/widgets/text_form_field_widget.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'Registro'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              TextFormFieldWidget(labelText: 'Nombre'),
              const SizedBox(height: 20),
              TextFormFieldWidget(labelText: 'Apellido'),
              const SizedBox(height: 20),
              TextFormFieldWidget(
                  labelText: 'Número de teléfono',
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(fontFamily: 'Cairo-Regular'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormFieldWidget(
                obscureText: _obscurePassword,
                labelText: 'Contraseña',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              TextFormFieldWidget(labelText: 'Cupón de referido (opcional)'),
              const SizedBox(height: 20),
              CheckboxWidget(
                labelText: 'Aceptar Términos y Condiciones',
                value: false,
                onChanged: (bool? value) {},
              ),
              const SizedBox(height: 40),
              LargeButtonWidget(
                onPressed: () {},
                buttonText: 'Registrar',
                colorOption: ButtonColorOption.option1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
