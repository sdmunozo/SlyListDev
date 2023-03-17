import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';

enum ButtonColorOption { option1, option2, option3 }

class SmallButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final ButtonColorOption colorOption;
  final double fontSize;
  final double? minHeight;

  SmallButtonWidget({
    required this.onPressed,
    required this.buttonText,
    this.colorOption = ButtonColorOption.option1,
    this.fontSize = 14.0,
    this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Color backgroundColor;
    Color textColor;

    switch (colorOption) {
      case ButtonColorOption.option1:
        backgroundColor = AppTheme.primaryNavyBlue;
        textColor = Colors.white;
        break;
      case ButtonColorOption.option2:
        backgroundColor = AppTheme.primaryRed;
        textColor = Colors.white;
        break;
      case ButtonColorOption.option3:
        backgroundColor = AppTheme.secondaryLightGray;
        textColor = AppTheme.primaryNavyBlue;
        break;
    }

    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textTheme.button!.copyWith(
          color: textColor,
          fontSize: fontSize,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: minHeight != null ? Size.fromHeight(minHeight!) : null,
      ),
    );
  }
}
