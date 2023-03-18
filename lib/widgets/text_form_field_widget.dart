import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Function(String)? onChanged;

  TextFormFieldWidget({
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
