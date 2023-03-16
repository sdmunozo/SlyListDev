import 'package:flutter/material.dart';

class SelectionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const SelectionWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(
                icon,
                color: Colors.white,
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.subtitle1,
                  ),
                  if (subTitle.isNotEmpty)
                    Text(
                      subTitle,
                      style: textTheme.bodyText2!
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                ],
              ),
            ),
            Checkbox(
              value: isSelected,
              onChanged: onChanged,
              activeColor: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
