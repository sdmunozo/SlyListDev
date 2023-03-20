// lib/models/service.dart
import 'package:flutter/material.dart';
import 'package:slylist_app/_models/feature_model.dart';

class Service {
  final String id;
  final String name;
  final IconData icon; // Agregado
  final Color color; // Agregado
  final bool enabled; // Agregado
  final double baseCost;
  final List<QuantityFeature> quantityFeatures;
  final List<SelectionFeature> selectionFeatures;
  final List<Feature> features;
  final DateTime date;
  final String time;
  final String paymentMethod;

  Service({
    required this.id,
    required this.name,
    required this.icon, // Agregado
    required this.color, // Agregado
    required this.enabled, // Agregado
    required this.baseCost,
    required this.quantityFeatures,
    required this.selectionFeatures,
    required this.features,
    required this.date,
    required this.time,
    required this.paymentMethod,
  });

  double get totalCost {
    double quantityFeaturesCost =
        quantityFeatures.fold(0, (total, feature) => total + feature.totalCost);
    double selectionFeaturesCost = selectionFeatures.fold(
        0, (total, feature) => total + (feature.isSelected ? feature.cost : 0));

    return baseCost + quantityFeaturesCost + selectionFeaturesCost;
  }
}
