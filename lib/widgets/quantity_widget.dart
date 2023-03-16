import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';

class QuantityWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final int quantity;
  final Function() onIncrement;
  final Function() onDecrement;

  QuantityWidget({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          Icon(icon, size: 50, color: primaryColorBlue),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: primaryTextTitleStyle.copyWith(fontSize: 18),
              ),
              Text(
                subTitle,
                style: primaryTextSubtitleStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.remove, color: primaryColorBlue),
            onPressed: onDecrement,
          ),
          Text(quantity.toString(),
              style: primaryTextTitleStyle.copyWith(fontSize: 26)),
          IconButton(
            icon: Icon(Icons.add, color: primaryColorBlue),
            onPressed: onIncrement,
          ),
        ],
      ),
    );
  }
}
