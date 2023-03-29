// models/requested_service.dart

import 'dart:ffi';

import 'package:slylist_app/domains/models/service.dart';

class RequestedService {
  final String id;
  final ServiceCategoryType category;
  final ServiceStatusType status;
  final String addressId;
  final DateTime dateTime;
  final String paymentMethodId;
  final String paymentMethod;
  final double slyRating;
  final double cost;
  final Service service;
  final String slyerId;
  final String slyerfirstName;
  final String slyerlastName;
  final double slyerRating;

  RequestedService({
    required this.id,
    required this.category,
    this.status = ServiceStatusType.Appointment,
    required this.addressId,
    required this.dateTime,
    required this.paymentMethodId,
    required this.paymentMethod,
    required this.cost,
    required this.service,
    this.slyRating = -1,
    this.slyerId = "",
    this.slyerfirstName = "Sin",
    this.slyerlastName = "Asignar",
    this.slyerRating = -1,
  });
}

enum ServiceCategoryType { Requested, Provided }

enum ServiceStatusType { Completed, Appointment, Cancelled }
