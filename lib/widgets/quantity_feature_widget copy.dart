import 'package:flutter/material.dart';
import 'package:slylist_app/_models/feature_model.dart';
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
      child: ListTile(
        leading: Icon(icon, size: 50, color: AppTheme.primaryNavyBlue),
        title: Text(
          feature.title,
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18),
        ),
        subtitle: Text(
          feature.subTitle,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove, color: AppTheme.primaryNavyBlue),
              onPressed: onDecrement,
            ),
            Text(feature.quantity.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 26)),
            IconButton(
              icon: Icon(Icons.add, color: AppTheme.primaryNavyBlue),
              onPressed: onIncrement,
            ),
          ],
        ),
      ),
    );
  }
}
