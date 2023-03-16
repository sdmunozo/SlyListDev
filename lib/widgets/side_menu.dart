// lib/widgets/side_menu.dart
import 'package:flutter/material.dart';

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
              color: Color(0xFF142449),
            ),
          ),
          _createDrawerItem(
              icon: Icons.person, text: 'Cuenta', onTap: () => print('Cuenta')),
          _createDrawerItem(
              icon: Icons.payment,
              text: 'Mis métodos de pago',
              onTap: () => print('Mis métodos de pago')),
          _createDrawerItem(
              icon: Icons.history,
              text: 'Historial de servicios',
              onTap: () => print('Historial de servicios')),
          _createDrawerItem(
              icon: Icons.location_on,
              text: 'Mis direcciones',
              onTap: () => print('Mis direcciones')),
          _createDrawerItem(
              icon: Icons.description,
              text: 'Términos y Condiciones',
              onTap: () => print('Términos y Condiciones')),
          _createDrawerItem(
              icon: Icons.help, text: 'Ayuda', onTap: () => print('Ayuda')),
          _createDrawerItem(
              icon: Icons.logout,
              text: 'Cerrar sesión',
              onTap: () => print('Cerrar sesión')),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text, style: TextStyle(fontFamily: 'Cairo-Regular')),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
