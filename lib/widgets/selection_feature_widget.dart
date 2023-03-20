import 'package:flutter/material.dart';
import 'package:slylist_app/_models/feature_model.dart';
import 'package:slylist_app/theme.dart';

class SelectionFeatureWidget extends StatelessWidget {
  final IconData icon;
  final SelectionFeature feature;
  final ValueChanged<bool?> onChanged;

  const SelectionFeatureWidget({
    Key? key,
    required this.icon,
    required this.feature,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);

    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon, color: Colors.white),
          backgroundColor: AppTheme.primaryNavyBlue,
        ),
        title: Text(feature.title, style: appTheme.textTheme.subtitle1),
        subtitle: feature.subTitle.isNotEmpty
            ? Text(
                feature.subTitle,
                style: appTheme.textTheme.subtitle2!
                    .copyWith(color: AppTheme.secondaryBlueGray, fontSize: 14),
              )
            : null,
        trailing: Checkbox(
          value: feature.isSelected,
          onChanged: onChanged,
          activeColor: AppTheme.primaryRed,
        ),
      ),
    );
  }
}
