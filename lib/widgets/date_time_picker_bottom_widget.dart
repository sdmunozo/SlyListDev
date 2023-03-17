import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slylist_app/screens/confirmation_screen.dart';
import 'package:slylist_app/theme.dart';
import 'package:slylist_app/widgets/small_button_widget.dart';

class DateTimePickerBottomSheet extends StatefulWidget {
  @override
  _DateTimePickerBottomSheetState createState() =>
      _DateTimePickerBottomSheetState();
}

class _DateTimePickerBottomSheetState extends State<DateTimePickerBottomSheet> {
  late DateTime _selectedDateTime;

  final int hoursToAdd = 20;

  @override
  void initState() {
    super.initState();
    _selectedDateTime =
        _roundUpToNextHalfHour(DateTime.now().add(Duration(hours: hoursToAdd)));
  }

  DateTime _roundUpToNextHalfHour(DateTime dateTime) {
    int minute = dateTime.minute;
    int nextHalfHour = ((minute + 29) ~/ 30) * 30;
    return DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour)
        .add(Duration(minutes: nextHalfHour));
  }

  @override
  Widget build(BuildContext context) {
    final minimumDateTime = DateTime.now().add(Duration(hours: hoursToAdd));

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
              minimumDate: minimumDateTime,
              minuteInterval: 30,
              mode: CupertinoDatePickerMode.dateAndTime,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SmallButtonWidget(
                  colorOption: ButtonColorOption.option3,
                  fontSize: 30,
                  onPressed: () => Navigator.pop(context),
                  buttonText: 'Cancelar'),
              SmallButtonWidget(
                  colorOption: ButtonColorOption.option1,
                  fontSize: 30,
                  onPressed: () => () {
                        Navigator.pop(context, _selectedDateTime);
                        _navigateToConfirmationScreen(context);
                      },
                  buttonText: 'Continuar'),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  SmallButtonWidget _buildElevatedButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return SmallButtonWidget(onPressed: onPressed, buttonText: text);
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
