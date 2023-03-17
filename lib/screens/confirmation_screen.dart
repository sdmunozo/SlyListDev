import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';

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
                      fontFamily: 'Cairo-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              Text(content,
                  style: TextStyle(fontFamily: 'Cairo-Bold', fontSize: 15)),
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
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
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
                          fontFamily: 'Cairo-Bold'),
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
                  labelStyle: TextStyle(fontFamily: 'Cairo-Regular'),
                ),
                value: _selectedPaymentMethod,
                items: [
                  DropdownMenuItem<String>(
                    child: Text('Efectivo',
                        style: TextStyle(fontFamily: 'Cairo-Regular')),
                    value: 'credit_card',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('PayPal',
                        style: TextStyle(fontFamily: 'Cairo-Regular')),
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
                children: [
                  Checkbox(
                    value: _isAgreed,
                    onChanged: (value) {
                      setState(() {
                        _isAgreed = value!;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      'Confirmo que poseo autorización para el servicio solicitado en el inmueble.',
                      style:
                          TextStyle(fontSize: 16, fontFamily: 'Cairo-Regular'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isAgreed
                      ? () {
// Implementar la funcionalidad de pago aquí
                        }
                      : null,
                  child: Text(
                    'Pagar servicio',
                    style: TextStyle(fontSize: 20, fontFamily: 'Cairo-Bold'),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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
