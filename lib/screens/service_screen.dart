import 'package:flutter/material.dart';
import 'package:slylist_app/domains/models/feature.dart';
import 'package:slylist_app/domains/models/service.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/widgets/date_time_picker_bottom_widget.dart';
import 'package:slylist_app/widgets/large_button_widget.dart';
import 'package:slylist_app/widgets/quantity_feature_widget.dart';
import 'package:slylist_app/widgets/selection_feature_widget.dart';

class ServiceScreen extends StatefulWidget {
  final Service service;

  ServiceScreen({required this.service});

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  late TextTheme textTheme;

  double _calculateTotalCost() {
    double totalIncluded = 0;
    double totalExcluded = 0;
    double quantityIncluded = 0;

// calcular el total de los features incluidos en el costo base
    for (Feature feature in widget.service.features) {
      if (feature.isIncludedInBaseCost) {
        if (feature.type == FeatureType.selection) {
          totalIncluded +=
              feature.weight * feature.cost * (feature.selected ? 1 : 0);
        } else if (feature.type == FeatureType.quantity) {
          totalIncluded += feature.cost * feature.quantity;

          if (widget.service.priority == PriorityType.quantity) {
            if ((feature.quantity - feature.baseQuantityIncluded) > 0) {
              quantityIncluded =
                  (feature.quantity - feature.baseQuantityIncluded) *
                      feature.cost;
            }
          }
        }
      }
    }
// si el total incluido es menor que el costo base, no se agrega nada al total
    if (totalIncluded < widget.service.baseCost) {
      totalIncluded = widget.service.baseCost + quantityIncluded;
    } else if (widget.service.priority == PriorityType.quantity) {
      totalIncluded = widget.service.baseCost + quantityIncluded;
    }

// calcular el total de los features no incluidos en el costo base
    for (Feature feature in widget.service.features) {
      if (!feature.isIncludedInBaseCost) {
        if (feature.type == FeatureType.selection) {
          totalExcluded += feature.cost * (feature.selected ? 1 : 0);
        } else if (feature.type == FeatureType.quantity) {
          totalExcluded += feature.cost * feature.quantity;
        }
      }
    }

    return totalIncluded + totalExcluded;
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    List<Feature> sortedFeatures = [...widget.service.features];
    sortedFeatures.sort((a, b) {
      if (a.type == FeatureType.quantity && b.type != FeatureType.quantity) {
        return -1;
      } else if (a.type != FeatureType.quantity &&
          b.type == FeatureType.quantity) {
        return 1;
      } else {
        return 0;
      }
    });

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.service.name,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                buildTitle(textTheme, context),
                // Genera los widgets de forma dinámica a partir del arreglo sortedFeatures
                ...sortedFeatures.map((info) {
                  return buildFeaturesWidgets(info);
                }).toList(),
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
      widget.service.text,
      textAlign: TextAlign.center,
      style: textTheme.headline5!.copyWith(
          fontFamily: 'SohoGothicPro-Bold',
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
    );
  }

  Widget buildFeaturesWidgets(Feature info) {
    if (info.type == FeatureType.selection) {
      return SelectionFeatureWidget(
        feature: info,
        onSelected: (selected) {
          setState(() {
            info.selected = selected;
          });
        },
      );
    } else if (info.type == FeatureType.quantity) {
      return QuantityFeatureWidget(
        feature: info,
        onQuantityChanged: (quantity) {
          setState(() {
            info.quantity = quantity;
          });
        },
      );
    } else {
      throw Exception('Tipo de Feature no soportado.');
    }
  }

  Column buildTotal(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
                  text: '\$${(_calculateTotalCost()).toStringAsFixed(2)}',
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
