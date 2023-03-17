import 'package:flutter/material.dart';
import 'package:slylist_app/screens/service_details_screen.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/models/feature_model.dart';

class ServiceHistoryScreen extends StatefulWidget {
  @override
  _ServiceHistoryScreenState createState() => _ServiceHistoryScreenState();
}

class _ServiceHistoryScreenState extends State<ServiceHistoryScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<ServiceHistory> scheduledServices = _getScheduledServices();
  final List<ServiceHistory> completedServices = _getCompletedServices();

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
  final List<ServiceHistory> serviceList;

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

  Widget _buildServiceCard(BuildContext context, ServiceHistory service) {
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

  Widget _buildServiceHeader(BuildContext context, ServiceHistory service) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(service.icon, size: 40, color: Theme.of(context).primaryColor),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(service.date, style: Theme.of(context).textTheme.subtitle1),
            SizedBox(height: 4),
            Text(service.time),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceInformation(
      BuildContext context, ServiceHistory service) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(service.serviceName, style: Theme.of(context).textTheme.subtitle2),
        SizedBox(height: 8),
        Text('Costo: \$${service.cost.toStringAsFixed(2)}'),
        SizedBox(height: 4),
        Text('Dirección: ${service.address}'),
        SizedBox(height: 4),
        Text('Forma de pago: ${service.paymentMethod}'),
        SizedBox(height: 4),
        Text('Persona que lo realizará: ${service.serviceProvider}'),
      ],
    );
  }

  Widget _buildServiceButtonOrRating(
      BuildContext context, ServiceHistory service) {
    return service.completed
        ? service.rating != null
            ? _buildRatingRow(context, service.rating!)
            : _buildRatingButton(context, service)
        : _buildDetailsButton(context, service);
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

  Widget _buildRatingButton(BuildContext context, ServiceHistory service) {
    return ElevatedButton(
      onPressed: () {
        print('Calificar servicio ${service.serviceName}');
      },
      child: Text('Calificar'),
      style: ElevatedButton.styleFrom(primary: Theme.of(context).accentColor),
    );
  }

  Widget _buildDetailsButton(BuildContext context, ServiceHistory service) {
    return ElevatedButton(
      onPressed: () {
        print('Más detalles de servicio ${service.serviceName}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailsScreen(service: service),
          ),
        );
      },
      child: Text('Más detalles'),
      style: ElevatedButton.styleFrom(primary: Theme.of(context).accentColor),
    );
  }
}

List<ServiceHistory> _getScheduledServices() {
// Ejemplos de servicios programados y completados
  final List<ServiceHistory> scheduledServices = [
    ServiceHistory(
      completed: false,
      icon: Icons.home_repair_service,
      date: '2023-04-10',
      time: '15:00',
      serviceName: 'Limpieza',
      cost: 150.0,
      address: 'Calle 123 #45-67',
      paymentMethod: 'Tarjeta de crédito',
      serviceProvider: 'Pedro Pérez',
      features: [
        QuantityFeature(
            id: 'q1',
            title: 'Cuartos',
            subTitle: '',
            quantity: 3,
            unitCost: 100.0),
        QuantityFeature(
            id: 'q2',
            title: 'Baños',
            subTitle: '',
            quantity: 2,
            unitCost: 100.0),
        QuantityFeature(
            id: 'q3',
            title: 'Áreas comunes',
            subTitle: '(Sala, comedor)',
            quantity: 3,
            unitCost: 30.0),
        SelectionFeature(
            id: 's1',
            title: 'Limpieza profunda',
            subTitle: 'Fiestas, suciedad acumulada (+200)',
            isSelected: true,
            cost: 200.0),
      ],
    ),
    ServiceHistory(
      completed: false,
      icon: Icons.electrical_services,
      date: '2023-04-15',
      time: '09:00',
      serviceName: 'Instalación eléctrica',
      cost: 200.0,
      address: 'Avenida 76 #20-30',
      paymentMethod: 'Efectivo',
      serviceProvider: 'Juan García',
      features: [
        QuantityFeature(
            id: 'q1',
            title: 'Característica de cantidad 1',
            subTitle: 'Subtítulo de cantidad 1',
            quantity: 1,
            unitCost: 10.0),
        QuantityFeature(
            id: 'q2',
            title: 'Característica de cantidad 2',
            subTitle: 'Subtítulo de cantidad 2',
            quantity: 2,
            unitCost: 20.0),
        QuantityFeature(
            id: 'q3',
            title: 'Característica de cantidad 3',
            subTitle: 'Subtítulo de cantidad 3',
            quantity: 3,
            unitCost: 30.0),
        SelectionFeature(
            id: 's1',
            title: 'Característica de selección 1',
            subTitle: 'Subtítulo de selección 1',
            isSelected: false,
            cost: 50.0),
        SelectionFeature(
            id: 's2',
            title: 'Característica de selección 2',
            subTitle: 'Subtítulo de selección 2',
            isSelected: true,
            cost: 100.0),
        SelectionFeature(
            id: 's3',
            title: 'Característica de selección 3',
            subTitle: 'Subtítulo de selección 3',
            isSelected: false,
            cost: 150.0),
      ],
    ),
  ];

  return scheduledServices;
}

List<ServiceHistory> _getCompletedServices() {
  final List<ServiceHistory> completedServices = [
    ServiceHistory(
      completed: true,
      icon: Icons.cleaning_services,
      date: '2023-03-20',
      time: '14:00',
      serviceName: 'Limpieza de hogar',
      cost: 100.0,
      address: 'Carrera 50 #25-80',
      paymentMethod: 'Efectivo',
      serviceProvider: 'María Rodríguez',
      features: [
        QuantityFeature(
            id: 'q1',
            title: 'Característica de cantidad 1',
            subTitle: 'Subtítulo de cantidad 1',
            quantity: 1,
            unitCost: 10.0),
        SelectionFeature(
            id: 's3',
            title: 'Característica de selección 3',
            subTitle: 'Subtítulo de selección 3',
            isSelected: false,
            cost: 150.0),
      ],
    ),
    ServiceHistory(
      completed: true,
      icon: Icons.grass, // Cambiado el icono a "grass"
      date: '2023-03-25',
      time: '10:00',
      serviceName: 'Mantenimiento de jardín',
      cost: 120.0,
      address: 'Diagonal 60 #35-90',
      paymentMethod: 'Tarjeta de crédito',
      serviceProvider: 'José Gómez',
      rating: 4,
      features: [
        QuantityFeature(
            id: 'q1',
            title: 'Característica de cantidad 1',
            subTitle: 'Subtítulo de cantidad 1',
            quantity: 1,
            unitCost: 10.0),
        SelectionFeature(
            id: 's3',
            title: 'Característica de selección 3',
            subTitle: 'Subtítulo de selección 3',
            isSelected: false,
            cost: 150.0),
      ],
    ),
  ];

  return completedServices;
}

class ServiceHistory {
  final bool completed;
  final IconData icon;
  final String date;
  final String time;
  final String serviceName;
  final double cost;
  final String address;
  final String paymentMethod;
  final String serviceProvider;
  final int? rating;
  final List<Feature> features;

  ServiceHistory({
    required this.completed,
    required this.icon,
    required this.date,
    required this.time,
    required this.serviceName,
    required this.cost,
    required this.address,
    required this.paymentMethod,
    required this.serviceProvider,
    required this.features,
    this.rating,
  });
}
