import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;

  CustomAppBar({required this.title, this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          primaryColorBlue, // Use the primary blue color from the theme
      title: Text(
        title,
        style:
            primaryTextTitleStyle, // Use the primary title text style from the theme
      ),
      centerTitle: true,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
