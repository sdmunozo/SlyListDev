import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slylist_app/screens/confirmation_screen.dart';
import 'package:slylist_app/theme.dart';

class DateTimePickerBottomSheet extends StatefulWidget {
  @override
  _DateTimePickerBottomSheetState createState() =>
      _DateTimePickerBottomSheetState();
}

class _DateTimePickerBottomSheetState extends State<DateTimePickerBottomSheet> {
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = _roundUpToNextHalfHour(DateTime.now());
  }

  DateTime _roundUpToNextHalfHour(DateTime dateTime) {
    int minute = dateTime.minute;
    int nextHalfHour = ((minute + 29) ~/ 30) * 30;
    return DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour)
        .add(Duration(minutes: nextHalfHour));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Selecciona fecha y hora',
            style: Theme.of(context).textTheme.headline6,
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
              _buildElevatedButton(
                context,
                'Cancelar',
                AppTheme.secondaryLightGray,
                Theme.of(context).primaryColor,
                () => Navigator.pop(context),
              ),
              _buildElevatedButton(
                context,
                'Continuar',
                Theme.of(context).primaryColor,
                Theme.of(context).backgroundColor,
                () {
                  Navigator.pop(context, _selectedDateTime);
                  _navigateToConfirmationScreen(context);
                },
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  ElevatedButton _buildElevatedButton(BuildContext context, String text,
      Color primary, Color onPrimary, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.button,
      ),
      style: ElevatedButton.styleFrom(
        primary: primary,
        onPrimary: onPrimary,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void _navigateToConfirmationScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationScreen(),
      ),
    );
  }
}
