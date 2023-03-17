import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Registro'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(fontFamily: 'Cairo-Regular'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  labelStyle: TextStyle(fontFamily: 'Cairo-Regular'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Número de teléfono',
                  labelStyle: TextStyle(fontFamily: 'Cairo-Regular'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(fontFamily: 'Cairo-Regular'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: const TextStyle(fontFamily: 'Cairo-Regular'),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Cupón de referido (opcional)',
                  labelStyle: TextStyle(fontFamily: 'Cairo-Regular'),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const Expanded(
                    child: Text(
                      'Aceptar Términos y Condiciones',
                      style: TextStyle(fontFamily: 'Cairo-Regular'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFED193E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontFamily: 'SohoGothicPro-Bold',
                    fontSize: 18,
                  ),
                ),
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
