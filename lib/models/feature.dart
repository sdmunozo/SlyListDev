// models/feature.dart

class Feature {
  final String id;
  final String type;
  final String icon;
  final String name;
  final String note;
  final int quantity;
  final bool selected;
  final double cost;

  Feature({
    required this.id,
    required this.type,
    required this.icon,
    required this.name,
    required this.note,
    this.quantity = 0,
    this.selected = false,
    required this.cost,
  });
}
