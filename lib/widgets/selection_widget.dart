import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';

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
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
                    title,
                    style: primaryTextSubtitleStyle,
                  ),
                  if (subTitle.isNotEmpty)
                    Text(
                      subTitle,
                      style: secondaryTextBodyStyle.copyWith(
                          color: secondaryColorBlueGrey, fontSize: 14),
                    ),
                ],
              ),
            ),
            Checkbox(
              value: isSelected,
              onChanged: onChanged,
              activeColor: primaryColorRed,
            ),
          ],
        ),
      ),
    );
  }
}
