// lib/screens/service_history_screen.dart
import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';

class ServiceHistoryScreen extends StatefulWidget {
  @override
  _ServiceHistoryScreenState createState() => _ServiceHistoryScreenState();
}

class _ServiceHistoryScreenState extends State<ServiceHistoryScreen> {
  final List<Service> _services = [
    Service(
      icon: Icons.cleaning_services,
      date: '15 de marzo, 2023',
      time: '14:30',
      serviceName: 'Limpieza',
      cost: 100,
      address: 'Calle Falsa 123, Ciudad X, Monterrey Nuevo León, México',
      paymentMethod: 'Efectivo',
      serviceProvider: 'Juana P.',
      rating:
          4, // Puedes cambiar este valor o eliminarlo si no hay calificación.
    ),
    Service(
      icon: Icons.cleaning_services,
      date: '10 de marzo, 2023',
      time: '10:15',
      serviceName: 'Limpieza',
      cost: 150,
      address: 'Calle Falsa 123, Ciudad X, Monterrey Nuevo León, México',
      paymentMethod: 'PayPal',
      serviceProvider: 'María R.',
      // No se incluye 'rating' aquí, lo que indica que no hay calificación.
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Historial de servicios',
      ),
      body: ListView.builder(
        itemCount: _services.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildServiceCard(_services[index]);
        },
      ),
    );
  }

  Widget _buildServiceCard(Service service) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(service.icon,
                    size: 40, color: Theme.of(context).primaryColor),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(service.date,
                        style: Theme.of(context).textTheme.subtitle1),
                    SizedBox(height: 4),
                    Text(service.time),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(service.serviceName,
                style: Theme.of(context).textTheme.subtitle2),
            SizedBox(height: 8),
            Text('Costo: \$${service.cost.toStringAsFixed(2)}'),
            SizedBox(height: 4),
            Text('Dirección: ${service.address}'),
            SizedBox(height: 4),
            Text('Forma de pago: ${service.paymentMethod}'),
            SizedBox(height: 4),
            Text('Persona que lo realizó: ${service.serviceProvider}'),
            SizedBox(height: 16),
            service.rating != null
                ? Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < service.rating!
                            ? Icons.star
                            : Icons.star_border,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      print('Calificar servicio ${service.serviceName}');
                    },
                    child: Text('Calificar'),
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).accentColor),
                  ),
          ],
        ),
      ),
    );
  }
}

class Service {
  final IconData icon;
  final String date;
  final String time;
  final String serviceName;
  final double cost;
  final String address;
  final String paymentMethod;
  final String serviceProvider;
  final int? rating;

  Service({
    required this.icon,
    required this.date,
    required this.time,
    required this.serviceName,
    required this.cost,
    required this.address,
    required this.paymentMethod,
    required this.serviceProvider,
    this.rating,
  });
}
