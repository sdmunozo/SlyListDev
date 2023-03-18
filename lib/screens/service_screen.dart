import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/widgets/date_time_picker_bottom_widget.dart';
import 'package:slylist_app/widgets/large_button_widget.dart';
import 'package:slylist_app/widgets/quantity_widget.dart';
import 'package:slylist_app/widgets/selection_widget.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  int _bedrooms = 0;
  int _bathrooms = 0;
  int _commonAreas = 0;
  late TextTheme textTheme;
  bool _deepCleaning = false;

  int _calculateTotal() {
    int total = (_bedrooms + _bathrooms + _commonAreas) * 100;
    if (_deepCleaning) {
      total += 200;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Limpieza',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                buildTitle(textTheme, context),
                buildQuantityWidgets(),
                buildSelectionWidget(),
                buildTotal(context),
                buildScheduleButton(context),
              ],
            ),
          ),
          buildAdSpace(),
        ],
      ),
    );
  }

  Text buildTitle(TextTheme textTheme, BuildContext context) {
    return Text(
      '¿Qué limpiaremos por ti?',
      textAlign: TextAlign.center,
      style: textTheme.headline5!.copyWith(
          fontFamily: 'SohoGothicPro-Bold',
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
    );
  }

  Widget buildQuantityWidgets() {
    return Column(
      children: [
        QuantityWidget(
          icon: Icons.king_bed,
          title: 'Cuartos',
          subTitle: '',
          quantity: _bedrooms,
          onIncrement: () {
            setState(() {
              _bedrooms++;
            });
          },
          onDecrement: () {
            setState(() {
              if (_bedrooms > 0) {
                _bedrooms--;
              }
            });
          },
        ),
        QuantityWidget(
          icon: Icons.bathtub,
          title: 'Baños',
          subTitle: '',
          quantity: _bathrooms,
          onIncrement: () {
            setState(() {
              _bathrooms++;
            });
          },
          onDecrement: () {
            setState(() {
              if (_bathrooms > 0) {
                _bathrooms--;
              }
            });
          },
        ),
        QuantityWidget(
          icon: Icons.weekend,
          title: 'Áreas comunes',
          subTitle: '(Sala, Comedor)',
          quantity: _commonAreas,
          onIncrement: () {
            setState(() {
              _commonAreas++;
            });
          },
          onDecrement: () {
            setState(() {
              if (_commonAreas > 0) {
                _commonAreas--;
              }
            });
          },
        ),
      ],
    );
  }

  SelectionWidget buildSelectionWidget() {
    return SelectionWidget(
      icon: Icons.cleaning_services,
      title: 'Limpieza profunda',
      subTitle: 'Fiestas, suciedad acumulada(+200)',
      isSelected: _deepCleaning,
      onChanged: (bool? value) {
        setState(() {
          _deepCleaning = value ?? false;
        });
      },
    );
  }

  Column buildTotal(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Text(
            'Total',
            style: textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '\$${_calculateTotal()} ',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                TextSpan(
                  text: 'MXN',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildScheduleButton(BuildContext context) {
    return LargeButtonWidget(
      colorOption: ButtonColorOption.option3,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height *
                0.5, // establecer la altura
            child: DateTimePickerBottomSheet(),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
        );
      },
      buttonText: 'Programar visita',
    );
  }

  Container buildAdSpace() {
    return Container(
      height: 170,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).primaryColorLight,
      child: Center(
        child: Text(
          'Espacio para publicidad',
          style: textTheme.bodyText1!.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
