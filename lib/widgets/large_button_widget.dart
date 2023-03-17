import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';

enum ButtonColorOption { option1, option2, option3 }

class LargeButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final ButtonColorOption colorOption;
  final double? fontSize;

  LargeButtonWidget({
    required this.onPressed,
    required this.buttonText,
    this.colorOption = ButtonColorOption.option1,
    this.fontSize,
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

    return Padding(
      padding: EdgeInsets.all(6),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textTheme.headline5!.copyWith(
            fontFamily: 'SohoGothicPro',
            fontWeight: FontWeight.bold,
            color: textColor,
            fontSize: fontSize ?? 24.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
