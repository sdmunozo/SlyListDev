import 'package:flutter/material.dart';
import 'package:slylist_app/data/ListIconData.dart';
import 'package:slylist_app/domains/models/feature.dart';
import 'package:slylist_app/app/theme.dart';

class QuantityFeatureWidget extends StatefulWidget {
  final Feature feature;
  final Function(int) onQuantityChanged;

  QuantityFeatureWidget(
      {required this.feature, required this.onQuantityChanged});

  @override
  _QuantityFeatureWidgetState createState() => _QuantityFeatureWidgetState();
}

class _QuantityFeatureWidgetState extends State<QuantityFeatureWidget> {
  void onIncrement() {
    widget.onQuantityChanged(widget.feature.quantity + 1);
  }

  void onDecrement() {
    if (widget.feature.quantity > 0) {
      widget.onQuantityChanged(widget.feature.quantity - 1);
    }
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
        leading: Icon(iconMap[widget.feature.icon] ?? Icons.error,
            size: 50, color: AppTheme.primaryNavyBlue),
        title: Text(
          widget.feature.name,
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18),
        ),
        subtitle: Text(
          widget.feature.note,
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
