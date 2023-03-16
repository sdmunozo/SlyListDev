import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColorBlue, // Usa el color primario azul del tema
      title: Text(
        title,
        style:
            primaryTextTitleStyle, // Usa el estilo de título primario del tema
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
