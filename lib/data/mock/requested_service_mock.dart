import 'package:slylist_app/data/mock/services_mock.dart';
import 'package:slylist_app/domains/models/requested_service.dart';

final List<RequestedService> requestedServices = [
  // RequestedServices for userId 1
  RequestedService(
    id: '1',
    category: ServiceCategoryType.Requested,
    status: ServiceStatusType.Completed,
    addressId: '1',
    dateTime: DateTime.now().add(const Duration(days: 1)),
    paymentMethodId: '1',
    paymentMethod: 'Credit Card',
    cost: 50,
    service: services[0],
    slyerId: "2",
  ),
  RequestedService(
    id: '2',
    category: ServiceCategoryType.Provided,
    status: ServiceStatusType.Appointment,
    addressId: '2',
    dateTime: DateTime.now().add(const Duration(days: 2)),
    paymentMethodId: '2',
    paymentMethod: 'PayPal',
    cost: 75,
    service: services[1],
  ),
  RequestedService(
    id: '3',
    category: ServiceCategoryType.Requested,
    status: ServiceStatusType.Cancelled,
    addressId: '1',
    dateTime: DateTime.now().add(const Duration(days: 3)),
    paymentMethodId: '3',
    paymentMethod: 'Cash',
    cost: 100,
    service: services[4],
  ),
  RequestedService(
    id: '4',
    category: ServiceCategoryType.Requested,
    status: ServiceStatusType.Completed,
    slyerRating: 5,
    addressId: '1',
    dateTime: DateTime.now().add(const Duration(days: 3)),
    paymentMethodId: '3',
    paymentMethod: 'Cash',
    cost: 100,
    service: services[4],
  ),
];
