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
              color: AppTheme.primaryNavyBlue,
            ),
          ),
          ListTileTheme(
            iconColor: Colors.black87,
            textColor: Colors.black87,
            child: Column(
              children: [
                _createDrawerItem(
                  icon: Icons.account_circle,
                  text: 'Cuenta',
                  onTap: () => _navigateTo(context, AccountScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.payment,
                  text: 'Mis métodos de pago',
                  onTap: () => _navigateTo(context, PaymentMethodsScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.history,
                  text: 'Historial de servicios',
                  onTap: () => _navigateTo(context, ServiceHistoryScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.location_on,
                  text: 'Mis direcciones',
                  onTap: () => _navigateTo(context, AddressScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.description,
                  text: 'Términos y Condiciones',
                  onTap: () => _navigateTo(context, TermsAndConditionsScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.help,
                  text: 'Ayuda',
                  onTap: () => _navigateTo(context, HelpScreen()),
                ),
                _createDrawerItem(
                  icon: Icons.logout,
                  text: 'Cerrar sesión',
                  onTap: () => print('Cerrar sesión'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.pop(context); // Cierra el Drawer antes de navegar
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
