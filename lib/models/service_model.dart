// lib/models/service.dart
import 'package:slylist_app/models/feature_model.dart';

class Service {
  final String id;
  final String name;
  final double baseCost;
  final List<QuantityFeature> quantityFeatures;
  final List<SelectionFeature> selectionFeatures;
  final List<Feature> features;
  final DateTime date; // Agregado
  final String time; // Agregado
  final String paymentMethod; // Agregado

  Service({
    required this.id,
    required this.name,
    required this.baseCost,
    required this.quantityFeatures,
    required this.selectionFeatures,
    required this.features,
    required this.date, // Agregado
    required this.time, // Agregado
    required this.paymentMethod, // Agregado
  });

  double get totalCost {
    double quantityFeaturesCost =
        quantityFeatures.fold(0, (total, feature) => total + feature.totalCost);
    double selectionFeaturesCost = selectionFeatures.fold(
        0, (total, feature) => total + (feature.isSelected ? feature.cost : 0));

    return baseCost + quantityFeaturesCost + selectionFeaturesCost;
  }
}
