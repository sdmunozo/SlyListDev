// models/feature.dart

class Feature {
  final String id;
  final FeatureType type;
  final String icon;
  final String name;
  String note;
  int quantity;
  bool selected;
  final double cost;
  final bool isIncludedInBaseCost;
  final int baseQuantityIncluded;
  final double weight;

  Feature({
    required this.id,
    required this.type,
    required this.icon,
    required this.name,
    this.note = "",
    this.quantity = 0,
    this.selected = false,
    required this.cost,
    this.isIncludedInBaseCost = false,
    this.baseQuantityIncluded = 0,
    this.weight = 1,
  });
}

enum FeatureType {
  selection,
  quantity,
}
