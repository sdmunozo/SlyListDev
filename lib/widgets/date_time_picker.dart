// lib/widgets/date_time_picker.dart
import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Selecciona la fecha y hora de la visita',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365)),
              );
              if (pickedDate != null) {
                setState(() {
                  _selectedDate = pickedDate;
                });
              }
            },
            child: Text('Seleccionar fecha'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (BuildContext context, Widget? child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: false),
                    child: child!,
                  );
                },
              );
              if (pickedTime != null) {
                setState(() {
                  _selectedTime = pickedTime;
                });
              }
            },
            child: Text('Seleccionar hora'),
          ),
          SizedBox(height: 16),
          Text(
            'Fecha y hora seleccionada: ${_selectedDate.toString().substring(0, 10)} ${_selectedTime.format(context)}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Realiza alguna acción con la fecha y hora seleccionada
              Navigator.pop(context);
            },
            child: Text('Confirmar visita'),
          ),
        ],
      ),
    );
  }
}
