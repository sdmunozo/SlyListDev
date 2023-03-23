import 'package:flutter/material.dart';
import 'package:slylist_app/app/theme.dart';

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
    ThemeData appTheme = Theme.of(context);

    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon, color: Colors.white),
          backgroundColor: AppTheme.primaryNavyBlue,
        ),
        title: Text(title, style: appTheme.textTheme.subtitle1),
        subtitle: subTitle.isNotEmpty
            ? Text(
                subTitle,
                style: appTheme.textTheme.subtitle2!
                    .copyWith(color: AppTheme.secondaryBlueGray, fontSize: 14),
              )
            : null,
        trailing: Checkbox(
          value: isSelected,
          onChanged: onChanged,
          activeColor: AppTheme.primaryRed,
        ),
      ),
    );
  }
}
