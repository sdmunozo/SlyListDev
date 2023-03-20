// lib/models/feature.dart

abstract class Feature {
  final String id;
  final String title;
  final String subTitle;

  Feature({
    required this.id,
    required this.title,
    required this.subTitle,
  });
}

class QuantityFeature extends Feature {
  int quantity;
  double unitCost;

  QuantityFeature({
    required String id,
    required String title,
    required String subTitle,
    required this.quantity,
    required this.unitCost,
  }) : super(id: id, title: title, subTitle: subTitle);

  double get totalCost {
    return unitCost * quantity;
  }
}

class SelectionFeature extends Feature {
  bool isSelected;
  double cost;

  SelectionFeature({
    required String id,
    required String title,
    required String subTitle,
    required this.isSelected,
    required this.cost,
  }) : super(id: id, title: title, subTitle: subTitle);
}
