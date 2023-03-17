import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;

  CustomAppBar({required this.title, this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context)
          .primaryColor, // Use the primary color from the theme
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: Colors.white), // Set the text color to white
      ),
      centerTitle: true,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
