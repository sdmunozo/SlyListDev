import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';

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
      margin: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: enabled ? color : appTheme.disabledColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(width: 16),
            Text(
              serviceName,
              style: primaryTextTitleStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
