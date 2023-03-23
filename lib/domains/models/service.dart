// models/service.dart

import 'package:slylist_app/domains/models/feature.dart';

class Service {
  final String id;
  final String name;
  final String icon;
  final List<Feature> features;
  final bool enabled;
  final String text;
  final String color;
  final double baseCost;
  final int baseFeatures;
  final PriorityType priority;

  Service({
    required this.id,
    required this.name,
    required this.icon,
    required this.features,
    this.enabled = false,
    this.text = "Cómo podemos ayudarte",
    this.color = "#CCDCF4",
    this.baseCost = 0.0,
    this.baseFeatures = 0,
    this.priority = PriorityType.quantity,
  });
}

enum PriorityType {
  cost,
  quantity,
}
