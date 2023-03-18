import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slylist_app/screens/confirmation_screen.dart';
import 'package:slylist_app/theme.dart';
import 'package:slylist_app/widgets/large_button_widget.dart';
import 'package:slylist_app/widgets/small_button_widget.dart';

class DateTimePickerBottomSheet extends StatefulWidget {
  @override
  _DateTimePickerBottomSheetState createState() =>
      _DateTimePickerBottomSheetState();
}

class _DateTimePickerBottomSheetState extends State<DateTimePickerBottomSheet> {
  late DateTime _selectedDateTime;
  late DateTime _minimumDateTime;

  final int hoursToAdd = 20;

  @override
  void initState() {
    super.initState();
    _minimumDateTime = DateTime.now().add(Duration(hours: hoursToAdd));
    _selectedDateTime = _roundUpToNextHalfHour(_minimumDateTime);
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
              minimumDate: _minimumDateTime,
              minuteInterval: 30,
              mode: CupertinoDatePickerMode.dateAndTime,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 80.0,
                child: LargeButtonWidget(
                  colorOption: ButtonColorOption.option3,
                  onPressed: () => Navigator.pop(context),
                  buttonText: 'Cancelar',
                ),
              ),
              SizedBox(
                height: 80.0,
                child: LargeButtonWidget(
                  colorOption: ButtonColorOption.option2,
                  onPressed: () {
                    Navigator.pop(context, _selectedDateTime);
                    _navigateToConfirmationScreen(context);
                  },
                  buttonText: 'Continuar',
                ),
              ),
            ],
          ),
        ],

        ///aqui
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
