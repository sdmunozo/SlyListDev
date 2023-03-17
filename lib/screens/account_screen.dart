import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';
import 'package:slylist_app/widgets/large_button_widget.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  // ...

  Widget _buildTextFormField({
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    TextEditingController? controller,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: InkWell(
        onTap: () {
          // Implementar la funcionalidad de selección de imagen aquí
        },
        child: CircleAvatar(
          radius: 60,
          backgroundColor: AppTheme.secondaryLightGray,
          backgroundImage: AssetImage('assets/account.png'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cuenta'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfilePicture(),
              SizedBox(height: 20),
              _buildTextFormField(labelText: 'Nombre'),
              SizedBox(height: 10),
              _buildTextFormField(labelText: 'Apellido'),
              SizedBox(height: 10),
              _buildTextFormField(
                labelText: 'Número de teléfono',
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),
              _buildTextFormField(
                labelText: 'Correo electrónico',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              _buildTextFormField(
                labelText: 'Contraseña',
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).accentColor),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: LargeButtonWidget(
                  onPressed: () {
                    // Implementar la funcionalidad de guardar cambios aquí
                  },
                  buttonText: 'Guardar cambios',
                  colorOption: ButtonColorOption.option1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
