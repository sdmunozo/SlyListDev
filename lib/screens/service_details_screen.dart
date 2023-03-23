// service_details_screen.dart
import 'package:flutter/material.dart';
import 'package:slylist_app/app/theme.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/_models/feature_model.dart';
import 'package:slylist_app/widgets/quantity_feature_widget.dart';
import 'package:slylist_app/widgets/selection_feature_widget.dart';
import 'package:slylist_app/screens/service_history_screen.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceHistory service;

  const ServiceDetailsScreen({Key? key, required this.service})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldSubtitleStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(fontWeight: FontWeight.bold, fontFamily: 'Cairo-Bold');
    final regularSubtitleStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(fontSize: 20, fontFamily: 'Cairo-Regular');

    return Scaffold(
      appBar: CustomAppBar(title: service.serviceName),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        children: [
          /*
          const SizedBox(height: 10),
          Text('Usuario:', style: boldSubtitleStyle),
          Text('Carlos Martínez', style: regularSubtitleStyle),
          const SizedBox(height: 10),
          Text('Fecha y hora:', style: boldSubtitleStyle),
          Text('${service.date} ${service.time}', style: regularSubtitleStyle),
          const SizedBox(height: 10),
          Text('Servicio:', style: boldSubtitleStyle),
          Text('${service.serviceName}', style: regularSubtitleStyle),
          const SizedBox(height: 10),
          Text('Forma de pago:', style: boldSubtitleStyle),
          Text('${service.paymentMethod}', style: regularSubtitleStyle),
          const SizedBox(height: 16),
          ...service.features.map((Feature feature) {
            if (feature is QuantityFeature) {
              return QuantityFeatureWidget(
                icon: Icons.build,
                feature: feature,
                onIncrement: () {},
                onDecrement: () {},
              );
            } else if (feature is SelectionFeature) {
              return SelectionFeatureWidget(
                feature: feature,
                onChanged: (bool? isSelected) {},
              );
            } else {
              return const SizedBox.shrink();
            }
          }).toList(),
          const SizedBox(height: 16),*/
        ],
      ),
    );
  }
}
