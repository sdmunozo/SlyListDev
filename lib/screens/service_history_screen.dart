import 'package:flutter/material.dart';
import 'package:slylist_app/data/ListIconData.dart';
import 'package:slylist_app/data/mock/requested_service_mock.dart';
import 'package:slylist_app/domains/models/requested_service.dart';
import 'package:slylist_app/screens/service_details_screen.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/domains/models/feature.dart';
import 'package:slylist_app/app/theme.dart';
import 'package:slylist_app/widgets/small_button_widget.dart';
import 'package:intl/intl.dart';

class ServiceHistoryScreen extends StatefulWidget {
  @override
  _ServiceHistoryScreenState createState() => _ServiceHistoryScreenState();
}

class _ServiceHistoryScreenState extends State<ServiceHistoryScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<RequestedService> scheduledServices = _getScheduledServices();
  final List<RequestedService> completedServices = _getCompletedServices();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Servicios',
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Programados'),
              Tab(text: 'Completados'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ServiceList(
              serviceList: scheduledServices), // Lista de servicios programados
          ServiceList(
              serviceList: completedServices), // Lista de servicios completados
        ],
      ),
    );
  }
}

class ServiceList extends StatelessWidget {
  final List<RequestedService> serviceList;

  const ServiceList({required this.serviceList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: serviceList.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildServiceCard(context, serviceList[index]);
      },
    );
  }

  Widget _buildServiceCard(BuildContext context, RequestedService service) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildServiceHeader(context, service),
            SizedBox(height: 16),
            _buildServiceInformation(context, service),
            SizedBox(height: 16),
            _buildServiceButtonOrRating(context, service),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceHeader(
      BuildContext context, RequestedService requestedService) {
    DateTime serviceDateTime = requestedService.dateTime.toLocal();
    String date = DateFormat('MMM d, yyyy').format(serviceDateTime);
    String time = DateFormat('h:mm a').format(serviceDateTime);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(iconMap[requestedService.service.icon] ?? Icons.error,
            size: 40, color: AppTheme.primaryNavyBlue),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(date, style: AppTheme.lightTheme.textTheme.subtitle1),
            SizedBox(height: 4),
            Text(time),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceInformation(
      BuildContext context, RequestedService requestedService) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(requestedService.service.name,
            style: AppTheme.lightTheme.textTheme.subtitle2),
        SizedBox(height: 8),
        Text('Costo: \$${requestedService.cost.toStringAsFixed(2)}'),
        SizedBox(height: 4),
        Text('Dirección: ${requestedService.addressId}'),
        SizedBox(height: 4),
        Text('Forma de pago: ${requestedService.paymentMethod}'),
        SizedBox(height: 4),
        Text(
            'Persona que lo realizará: ${requestedService.slyerfirstName} ${requestedService.slyerlastName} ',
            style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }

  Widget _buildServiceButtonOrRating(
      BuildContext context, RequestedService requestedService) {
    if (requestedService.status == ServiceStatusType.Completed) {
      if (requestedService.slyerRating != -1) {
        return _buildRatingRow(context, (requestedService.slyerRating).toInt());
      } else {
        return _buildRatingButton(context, requestedService);
      }
    } else if (requestedService.status == ServiceStatusType.Cancelled) {
      return _buildCancelledButton(context, requestedService);
    } else {
      return _buildDetailsButton(context, requestedService);
    }
  }

  Widget _buildCancelledButton(
      BuildContext context, RequestedService requestedService) {
    return ElevatedButton(
      onPressed: null,
      child: Text('Cancelado', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildRatingRow(BuildContext context, int rating) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }

  Widget _buildRatingButton(BuildContext context, RequestedService service) {
    return SmallButtonWidget(
      onPressed: () {
        print('Calificar servicio ${service.service.name}');
      },
      buttonText: 'Calificar',
      colorOption: s_ButtonColorOption.option1,
    );
  }

  Widget _buildDetailsButton(BuildContext context, RequestedService service) {
    return SmallButtonWidget(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ServiceDetailsScreen(requestedService: service),
            ),
          );
        },
        buttonText: 'Más detalles',
        colorOption: s_ButtonColorOption.option1);
  }
}

List<RequestedService> _getScheduledServices() {
  return requestedServices
      .where((service) => service.status == ServiceStatusType.Appointment)
      .toList();
}

List<RequestedService> _getCompletedServices() {
  return requestedServices
      .where((service) =>
          service.status == ServiceStatusType.Cancelled ||
          service.status == ServiceStatusType.Completed)
      .toList();
}
