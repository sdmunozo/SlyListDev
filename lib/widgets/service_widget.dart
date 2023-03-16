import 'package:flutter/material.dart';

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
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: enabled ? color : Colors.grey,
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(width: 16),
            Text(
              serviceName,
              style: TextStyle(
                fontFamily: 'SohoGothicPro',
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
