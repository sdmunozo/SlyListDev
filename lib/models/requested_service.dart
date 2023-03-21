// models/requested_service.dart

import 'package:slylist_app/models/service.dart';

class RequestedService {
  final String id;
  final ServiceStatusType status;
  final String addressId;
  final DateTime dateTime;
  final String paymentMethodId;
  final String paymentMethod;
  final int slyRating;
  final int slyerRating;
  final double cost;
  final Service service;

  RequestedService({
    required this.id,
    required this.status,
    required this.addressId,
    required this.dateTime,
    required this.paymentMethodId,
    required this.paymentMethod,
    required this.cost,
    required this.service,
    this.slyRating = 0,
    this.slyerRating = 0,
  });
}

enum ServiceStatusType { Requested, Provided }
