import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/date_time_picker.dart';
import 'package:slylist_app/widgets/date_time_picker_bottom_sheet.dart';
import 'package:slylist_app/widgets/quantity_widget.dart';
import 'package:slylist_app/widgets/selection_widget.dart';
import 'package:slylist_app/screens/service_screen.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  int _bedrooms = 0;
  int _bathrooms = 0;
  int _commonAreas = 0;
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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Limpieza',
          style: textTheme.headline6!.copyWith(
            fontFamily: 'SohoGothicPro',
            fontWeight: FontWeight.bold,
            color:
                Theme.of(context).backgroundColor, // Aplica el hintColor aquí
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '¿Qué limpiaremos por ti?',
                      style: textTheme.headline5!.copyWith(
                          fontFamily: 'SohoGothicPro',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
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
                  SelectionWidget(
                    icon: Icons.cleaning_services,
                    title: 'Limpieza profunda',
                    subTitle: 'Fiestas, suciedad acumulada(+200)',
                    isSelected: _deepCleaning,
                    onChanged: (bool? value) {
                      setState(() {
                        _deepCleaning = value ?? false;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text(
                      'Total',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$${_calculateTotal()} ',
                            style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .primaryColor, // Aplica el backgroundColor aquí
                            ),
                          ),
                          TextSpan(
                            text: 'MXN',
                            style: TextStyle(
                              fontSize: 25,
                              color: Theme.of(context)
                                  .primaryColor, // Aplica el backgroundColor aquí
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => DateTimePickerBottomSheet(),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          isScrollControlled: true,
                        );
                      },
                      child: Text(
                        'Programar visita',
                        style: TextStyle(
                            fontFamily: 'SohoGothicPro', fontSize: 23),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFED193E),
                        onPrimary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),

                  // Espacio para publicidad
                ],
              ),
            ),
          ),
          Container(
            height: 170, // ajusta la altura aquí
            margin: EdgeInsets.only(top: 16, bottom: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.grey[300],
            child: Center(
              child: Text(
                'Espacio para publicidad',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
