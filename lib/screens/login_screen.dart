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
              SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/slylistLogoColor.png',
                  height: 150,
                  width: 150,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(fontFamily: 'Cairo-Regular'),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(fontFamily: 'Cairo-Regular'),
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
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    fontFamily: 'Cairo-Bold',
                    color: Color(0xFFED193E),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(
                    fontFamily: 'SohoGothicPro-Bold',
                    fontSize: 18,
                  ),
                ),
                child: Text('Iniciar sesión'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
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
                    child: Text(
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
