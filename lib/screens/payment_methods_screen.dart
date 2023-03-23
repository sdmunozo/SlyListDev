import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/app/theme.dart';

class PaymentMethodsScreen extends StatefulWidget {
  @override
  _PaymentMethodsScreenState createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  bool _isPayPalLoggedIn = false;
  String _payPalEmail = '';

  TextStyle paymentTextStyle = const TextStyle(
    fontSize: 20,
    fontFamily: 'Cairo-Regular',
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Métodos de pago'),
      body: ListView(
        children: <Widget>[
          _buildPaymentMethodItem(
            icon: Icons.attach_money,
            text: 'Efectivo',
            color: AppTheme.primaryRed,
            onTap: () {
              print('Efectivo seleccionado');
            },
          ),
          _buildPaymentMethodItem(
            icon: Icons.payment,
            text: 'PayPal',
            color: AppTheme.secondaryBlueGray,
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
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: paymentTextStyle,
                  ),
                  if (isLoggedIn)
                    Text(
                      email,
                      style: paymentTextStyle.copyWith(fontSize: 18),
                    ),
                ],
              ),
            ),
            if (isLoggedIn)
              Icon(
                Icons.check_circle,
                size: 30,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
