import 'package:flutter/material.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          Icon(icon, size: 50, color: Colors.black),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(subTitle, style: TextStyle(fontSize: 16)),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: onDecrement,
          ),
          Text(quantity.toString(), style: TextStyle(fontSize: 26)),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: onIncrement,
          ),
        ],
      ),
    );
  }
}
