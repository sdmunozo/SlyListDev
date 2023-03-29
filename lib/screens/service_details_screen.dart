// service_details_screen.dart
import 'package:flutter/material.dart';
import 'package:slylist_app/data/mock/users_mock.dart';
import 'package:slylist_app/domains/models/feature.dart';
import 'package:slylist_app/domains/models/requested_service.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/screens/service_history_screen.dart';
import 'package:intl/intl.dart';
import 'package:slylist_app/widgets/quantity_feature_widget.dart';
import 'package:slylist_app/widgets/selection_feature_widget.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final RequestedService requestedService;

  const ServiceDetailsScreen({Key? key, required this.requestedService})
      : super(key: key);

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
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

    final userMock = users[0];
    final RequestedService tempRequestedService =
        userMock.slyRequestedService[0];

    // Variables de vista
    final String tempName =
        "${tempRequestedService.slyerfirstName} ${tempRequestedService.slyerlastName}";

    final DateTime tempDateTime = tempRequestedService.dateTime;
    final formatter = DateFormat('dd/MM/yyyy - HH:mm');
    final formattedDateTime = formatter.format(tempDateTime);

    final tempServiceName = tempRequestedService.service.name;

    final tempPaymentMethod = tempRequestedService.paymentMethod;

    List<Feature> sortedFeatures = [
      ...widget.requestedService.service.features
    ];
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
      appBar: CustomAppBar(title: widget.requestedService.service.name),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        children: [
          const SizedBox(height: 10),
          Text('Slyer:', style: boldSubtitleStyle),
          Text(tempName, style: regularSubtitleStyle),
          const SizedBox(height: 10),
          Text('Fecha y hora:', style: boldSubtitleStyle),
          Text(formattedDateTime, style: regularSubtitleStyle),
          const SizedBox(height: 10),
          Text('Servicio:', style: boldSubtitleStyle),
          Text(tempServiceName, style: regularSubtitleStyle),
          const SizedBox(height: 10),
          Text('Forma de pago:', style: boldSubtitleStyle),
          Text(tempPaymentMethod, style: regularSubtitleStyle),
          // Genera los widgets de forma dinámica a partir del arreglo sortedFeatures
          ...sortedFeatures.map((info) {
            return buildFeaturesWidgets(info);
          }).toList(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

Widget buildFeaturesWidgets(Feature info) {
  if (info.type == FeatureType.selection) {
    return SelectionFeatureWidget(
      feature: info,
      onSelected: (selected) {
        /*setState(() {
          info.selected = selected;
        });*/
      },
    );
  } else if (info.type == FeatureType.quantity) {
    return QuantityFeatureWidget(
      feature: info,
      onQuantityChanged: (quantity) {
        /*setState(() {
          info.quantity = quantity;
        });*/
      },
    );
  } else {
    throw Exception('Tipo de Feature no soportado.');
  }
}
