import 'package:flutter/material.dart';
import 'package:slylist_app/screens/home_screen.dart';
import 'package:slylist_app/screens/register_screen.dart';
import 'package:slylist_app/screens/reset_password.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Iniciar sesión'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/slylistLogoColor.png',
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: const TextStyle(fontFamily: 'Cairo-Regular'),
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
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordScreen(),
                    ),
                  );
                },
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    fontFamily: 'Cairo-Bold',
                    color: Color(0xFFED193E),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes agregar la lógica de inicio de sesión y validación

                  // Si la validación es exitosa, navega a HomeScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFED193E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontFamily: 'SohoGothicPro-Bold',
                    fontSize: 18,
                  ),
                ),
                child: const Text('Iniciar sesión'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿No tienes cuenta?',
                    style: TextStyle(fontFamily: 'Cairo-Regular'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterForm(),
                        ),
                      );
                    },
                    child: const Text(
                      'Regístrate',
                      style: TextStyle(
                        fontFamily: 'Cairo-Bold',
                        color: Color(0xFFED193E),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
