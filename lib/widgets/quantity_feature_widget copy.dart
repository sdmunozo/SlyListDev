import 'package:flutter/material.dart';
import 'package:slylist_app/_models/feature_model.dart';
import 'package:slylist_app/theme.dart';

class QuantityFeatureWidget extends StatefulWidget {
  final IconData icon;
  final QuantityFeature feature;

  QuantityFeatureWidget({
    required this.icon,
    required this.feature,
  });

  @override
  _QuantityFeatureWidgetState createState() => _QuantityFeatureWidgetState();
}

class _QuantityFeatureWidgetState extends State<QuantityFeatureWidget> {
  void onIncrement() {
    setState(() {
      widget.feature.quantity++;
    });
  }

  void onDecrement() {
    setState(() {
      if (widget.feature.quantity > 0) {
        widget.feature.quantity--;
      }
    });
  }

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
        leading: Icon(widget.icon, size: 50, color: AppTheme.primaryNavyBlue),
        title: Text(
          widget.feature.title,
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18),
        ),
        subtitle: Text(
          widget.feature.subTitle,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove, color: AppTheme.primaryNavyBlue),
              onPressed: onDecrement,
            ),
            Text(widget.feature.quantity.toString(),
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
