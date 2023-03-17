import 'package:flutter/material.dart';
import 'package:slylist_app/models/feature_model.dart';
import 'package:slylist_app/theme.dart';

class QuantityFeatureWidget extends StatelessWidget {
  final IconData icon;
  final QuantityFeature feature;
  final Function() onIncrement;
  final Function() onDecrement;

  QuantityFeatureWidget({
    required this.icon,
    required this.feature,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                feature.title,
                style: primaryTextTitleStyle.copyWith(fontSize: 18),
              ),
              Text(
                feature.subTitle,
                style: primaryTextSubtitleStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.remove, color: primaryColorBlue),
            onPressed: onDecrement,
          ),
          Text(feature.quantity.toString(),
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
