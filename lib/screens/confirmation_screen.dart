import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/widgets/large_button_widget.dart';

class ConfirmationScreen extends StatefulWidget {
  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  bool _isAgreed = false;
  String? _selectedPaymentMethod;

  Widget _buildRow(IconData icon, String title, String content) {
    return Row(
      children: [
        Icon(icon, size: 35),
        SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontFamily:
                          AppTheme.lightTheme.textTheme.subtitle1!.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              Text(content,
                  style: TextStyle(
                      fontFamily:
                          AppTheme.lightTheme.textTheme.bodyText1!.fontFamily,
                      fontSize: 15)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Confirmación'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/slylistLogoColor.png',
                  height: 120,
                  width: 120,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppTheme.lightTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información del servicio:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppTheme
                              .lightTheme.textTheme.headline6!.fontFamily),
                    ),
                    SizedBox(height: 10),
                    _buildRow(Icons.cleaning_services, 'Tipo de servicio',
                        'Limpieza de hogar'),
                    SizedBox(height: 10),
                    _buildRow(Icons.location_on, 'Dirección del domicilio',
                        'Calle Falsa 123, Ciudad X, Monterrey Nuevo León, México'),
                    SizedBox(height: 10),
                    _buildRow(Icons.calendar_today, 'Fecha y hora de la cita',
                        '25 de marzo de 2023, 10:30 AM'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Forma de pago',
                  labelStyle: TextStyle(
                      fontFamily:
                          AppTheme.lightTheme.textTheme.subtitle1!.fontFamily),
                ),
                value: _selectedPaymentMethod,
                items: [
                  DropdownMenuItem<String>(
                    child: Text('Efectivo',
                        style: TextStyle(
                            fontFamily: AppTheme
                                .lightTheme.textTheme.bodyText1!.fontFamily)),
                    value: 'credit_card',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('PayPal',
                        style: TextStyle(
                            fontFamily: AppTheme
                                .lightTheme.textTheme.bodyText1!.fontFamily)),
                    value: 'paypal',
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: LargeButtonWidget(
                  onPressed: _isAgreed
                      ? () {
                          // Implementar la funcionalidad de pago aquí
                        }
                      : null,
                  buttonText: 'Pagar servicio',
                  colorOption: ButtonColorOption
                      .option1, // Selecciona la opción de color que prefieras
                  fontSize:
                      20.0, // Si deseas, puedes cambiar el tamaño de fuente aquí
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
