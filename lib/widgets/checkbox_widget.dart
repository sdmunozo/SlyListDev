import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  final String labelText;
  final bool initialValue;
  final ValueChanged<bool?> onChanged;
  final bool? value;

  CheckboxWidget({
    required this.labelText,
    this.initialValue = false,
    required this.onChanged,
    this.value,
  });

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  late bool _isAgreed;

  @override
  void initState() {
    super.initState();
    _isAgreed = widget.value ?? widget.initialValue;
  }

  void _toggleCheckbox() {
    setState(() {
      _isAgreed = !_isAgreed;
    });
    widget.onChanged(_isAgreed);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: _isAgreed,
          onChanged: (value) {
            _toggleCheckbox();
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width *
              0.6, // Ajusta el ancho según sea necesario
          child: GestureDetector(
            onTap: _toggleCheckbox, // Llamada a la función al tocar el texto
            child: Text(
              widget.labelText,
              style: TextStyle(
                fontSize: 16,
                fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
              ),
              maxLines: null, // Permitir que el texto sea multilinea
            ),
          ),
        ),
      ],
    );
  }
}
