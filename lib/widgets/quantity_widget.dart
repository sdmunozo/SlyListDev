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
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ListTile(
          leading: Icon(icon, size: 50, color: AppTheme.primaryNavyBlue),
          title: Text(
            title,
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18),
          ),
          subtitle: Text(
            subTitle,
            style:
                Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 16),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.remove, color: AppTheme.primaryNavyBlue),
                onPressed: onDecrement,
              ),
              Text(quantity.toString(),
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
      ),
    );
  }
}
