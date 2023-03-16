// lib/screens/payment_methods_screen.dart
import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';

class PaymentMethodsScreen extends StatefulWidget {
  @override
  _PaymentMethodsScreenState createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  bool _isPayPalLoggedIn = false;
  String _payPalEmail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Métodos de pago'),
      body: ListView(
        children: <Widget>[
          _buildPaymentMethodItem(
            icon: Icons.attach_money,
            text: 'Efectivo',
            color: Colors.green,
            onTap: () {
              print('Efectivo seleccionado');
            },
          ),
          _buildPaymentMethodItem(
            icon: Icons.payment,
            text: 'PayPal',
            color: Color(0xFF3B7BBF),
            onTap: () {
              print('PayPal seleccionado');
              setState(() {
                _isPayPalLoggedIn = true;
                _payPalEmail =
                    'correo@ejemplo.com'; // Cambiar por el correo electrónico de PayPal real
              });
              // Aquí puedes agregar la funcionalidad para registrar la cuenta de PayPal
            },
            isLoggedIn: _isPayPalLoggedIn,
            email: _payPalEmail,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodItem({
    required IconData icon,
    required String text,
    required Color color,
    required GestureTapCallback onTap,
    bool isLoggedIn = false,
    String email = '',
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Cairo-Regular',
                        color: Colors.white),
                  ),
                  if (isLoggedIn)
                    Text(
                      email,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Cairo-Regular',
                          color: Colors.white),
                    ),
                ],
              ),
            ),
            if (isLoggedIn)
              Icon(Icons.check_circle, size: 30, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
