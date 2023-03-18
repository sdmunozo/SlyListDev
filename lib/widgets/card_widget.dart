import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Color? cardColor;
  final double? titleFontSize;
  final double? subtitleFontSize;

  CardWidget({
    required this.title,
    required this.subtitle,
    this.leadingIcon,
    this.trailingIcon,
    this.cardColor,
    this.titleFontSize,
    this.subtitleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: cardColor ?? AppTheme.primaryRed,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: ListTile(
          leading: leadingIcon != null
              ? Icon(leadingIcon, size: 50, color: Colors.white)
              : null,
          title: Text(
            title,
            style: appTheme.textTheme.headline6!
                .copyWith(color: Colors.white, fontSize: titleFontSize ?? 20),
          ),
          subtitle: Text(
            subtitle,
            style: appTheme.textTheme.bodyText1!.copyWith(
                color: Colors.white, fontSize: subtitleFontSize ?? 16),
          ),
          trailing: trailingIcon != null
              ? Icon(trailingIcon, size: 35, color: Colors.white)
              : null,
        ),
      ),
    );
  }
}
