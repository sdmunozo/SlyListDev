import 'package:flutter/material.dart';
import 'package:slylist_app/models/feature_model.dart';
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
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(
                icon,
                color: Colors.white,
              ),
              backgroundColor: primaryColorBlue,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feature.title,
                    style: primaryTextSubtitleStyle,
                  ),
                  if (feature.subTitle.isNotEmpty)
                    Text(
                      feature.subTitle,
                      style: secondaryTextBodyStyle.copyWith(
                          color: secondaryColorBlueGrey, fontSize: 14),
                    ),
                ],
              ),
            ),
            Checkbox(
              value: feature.isSelected,
              onChanged: onChanged,
              activeColor: primaryColorRed,
            ),
          ],
        ),
      ),
    );
  }
}
