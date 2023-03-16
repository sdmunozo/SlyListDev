// lib/widgets/side_menu.dart
import 'package:flutter/material.dart';
import 'package:slylist_app/screens/account_screen.dart';
import 'package:slylist_app/screens/address_screen.dart';
import 'package:slylist_app/screens/help_screen.dart';
import 'package:slylist_app/screens/payment_methods_screen.dart';
import 'package:slylist_app/screens/service_history_screen.dart';
import 'package:slylist_app/screens/terms_and_conditions_screen.dart';
import 'package:slylist_app/theme.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset('assets/slylistLogoBlanco.png'),
            decoration: BoxDecoration(
              color: primaryColorBlue,
            ),
          ),
          _createDrawerItem(
            icon: Icons.account_circle,
            text: 'Cuenta',
            context: context,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountScreen()),
              );
            },
          ),
          _createDrawerItem(
            icon: Icons.payment,
            text: 'Mis métodos de pago',
            context: context,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentMethodsScreen()),
              );
            },
          ),
          _createDrawerItem(
            icon: Icons.history,
            text: 'Historial de servicios',
            context: context,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ServiceHistoryScreen()),
              );
            },
          ),
          _createDrawerItem(
            icon: Icons.location_on,
            text: 'Mis direcciones',
            context: context,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddressScreen()),
              );
            },
          ),
          _createDrawerItem(
            icon: Icons.description,
            text: 'Términos y Condiciones',
            context: context,
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TermsAndConditionsScreen(),
                ),
              );
            },
          ),
          _createDrawerItem(
            icon: Icons.help,
            text: 'Ayuda',
            context: context,
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpScreen(),
                ),
              );
            },
          ),
          _createDrawerItem(
            icon: Icons.logout,
            text: 'Cerrar sesión',
            context: context,
            onTap: () => print('Cerrar sesión'),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required BuildContext context,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 30, // Aumenta el tamaño del icono
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: secondaryTextBodyStyle.copyWith(
                  fontSize: 18), // Usa el estilo de texto secundario del tema
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
