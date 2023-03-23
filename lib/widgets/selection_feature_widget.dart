import 'package:flutter/material.dart';
import 'package:slylist_app/data/ListIconData.dart';
import 'package:slylist_app/domains/models/feature.dart';
import 'package:slylist_app/app/theme.dart';

class SelectionFeatureWidget extends StatefulWidget {
  final Feature feature;
  final Function(bool) onSelected;

  const SelectionFeatureWidget(
      {Key? key, required this.feature, required this.onSelected})
      : super(key: key);

  @override
  _SelectionFeatureWidgetState createState() => _SelectionFeatureWidgetState();
}

class _SelectionFeatureWidgetState extends State<SelectionFeatureWidget> {
  void onChanged(bool? value) {
    widget.onSelected(value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);

    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(iconMap[widget.feature.icon] ?? Icons.error,
              color: Colors.white),
          backgroundColor: AppTheme.primaryNavyBlue,
        ),
        title: Text(widget.feature.name, style: appTheme.textTheme.subtitle1),
        subtitle: widget.feature.note.isNotEmpty
            ? Text(
                widget.feature.note,
                style: appTheme.textTheme.subtitle2!
                    .copyWith(color: AppTheme.secondaryBlueGray, fontSize: 14),
              )
            : null,
        trailing: Checkbox(
          value: widget.feature.selected,
          onChanged: onChanged,
          activeColor: AppTheme.primaryRed,
        ),
      ),
    );
  }
}
