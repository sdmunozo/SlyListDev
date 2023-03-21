// models/service.dart

import 'package:slylist_app/models/feature.dart';

class Service {
  final String id;
  final String name;
  final String icon;
  final List<Feature> features;

  Service({
    required this.id,
    required this.name,
    required this.icon,
    required this.features,
  });
}
