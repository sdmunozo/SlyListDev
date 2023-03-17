import 'package:flutter/material.dart';
import 'package:slylist_app/theme.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/models/feature_model.dart';
import 'package:slylist_app/widgets/quantity_feature_widget.dart';
import 'package:slylist_app/widgets/selection_feature_widget.dart';
import 'package:slylist_app/screens/service_history_screen.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceHistory service;

  const ServiceDetailsScreen({Key? key, required this.service})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: service.serviceName,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        children: [
          SizedBox(height: 10),
          Text(
            'Usuario:',
            style:
                primaryTextSubtitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'Carlos Martínez',
            style: primaryTextSubtitleStyle.copyWith(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'Fecha y hora:',
            style:
                primaryTextSubtitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            '${service.date} ${service.time}',
            style: primaryTextSubtitleStyle.copyWith(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'Servicio:',
            style:
                primaryTextSubtitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            '${service.serviceName}',
            style: primaryTextSubtitleStyle.copyWith(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'Forma de pago:',
            style:
                primaryTextSubtitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            '${service.paymentMethod}',
            style: primaryTextSubtitleStyle.copyWith(fontSize: 20),
          ),
          SizedBox(height: 16),
          // Agregando widgets para QuantityFeature y SelectionFeature
          ...service.features.map((Feature feature) {
            if (feature is QuantityFeature) {
              return QuantityFeatureWidget(
                icon: Icons.build, // Reemplazar con el ícono que corresponda
                feature: feature,
                onIncrement: () {}, // Ajusta esta función según sea necesario
                onDecrement: () {}, // Ajusta esta función según sea necesario
              );
            } else if (feature is SelectionFeature) {
              return SelectionFeatureWidget(
                icon: Icons.check, // Reemplazar con el ícono que corresponda
                feature: feature,
                onChanged: (bool?
                    isSelected) {}, // Ajusta esta función según sea necesario
              );
            } else {
              return SizedBox.shrink();
            }
          }).toList(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
