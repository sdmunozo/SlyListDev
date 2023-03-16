import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slylist_app/screens/confirmation_screen.dart';

class DateTimePickerBottomSheet extends StatefulWidget {
  @override
  _DateTimePickerBottomSheetState createState() =>
      _DateTimePickerBottomSheetState();
}

class _DateTimePickerBottomSheetState extends State<DateTimePickerBottomSheet> {
  DateTime? _selectedDateTime;

  DateTime _roundUpToNextHalfHour(DateTime dateTime) {
    int minute = dateTime.minute;
    int nextHalfHour = ((minute + 29) ~/ 30) * 30;
    return DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour)
        .add(Duration(minutes: nextHalfHour));
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedDateTime == null) {
      _selectedDateTime = _roundUpToNextHalfHour(DateTime.now());
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Selecciona fecha y hora',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: CupertinoDatePicker(
              initialDateTime: _selectedDateTime,
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  _selectedDateTime = newDateTime;
                });
              },
              minimumDate: DateTime.now(),
              minuteInterval: 30,
              mode: CupertinoDatePickerMode.dateAndTime,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(fontFamily: 'SohoGothicPro', fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, _selectedDateTime);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmationScreen(),
                    ),
                  );
                },
                child: Text(
                  'Continuar',
                  style: TextStyle(fontFamily: 'SohoGothicPro', fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
