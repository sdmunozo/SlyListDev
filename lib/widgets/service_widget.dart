import 'package:flutter/material.dart';
import 'package:slylist_app/app/theme.dart';

class ServiceWidget extends StatelessWidget {
  final String serviceName;
  final IconData icon;
  final Color color;
  final bool enabled;

  ServiceWidget({
    required this.serviceName,
    required this.icon,
    required this.color,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: enabled ? color : appTheme.disabledColor,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Icon(icon, size: 40, color: Colors.white),
        title: Text(
          serviceName,
          style: appTheme.textTheme.headline5!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
