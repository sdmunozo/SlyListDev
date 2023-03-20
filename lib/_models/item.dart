class Item {
  final String type;
  final String icon;
  final String name;
  final String note;
  final num? quantity;
  final bool? selected;

  Item({
    required this.type,
    required this.icon,
    required this.name,
    required this.note,
    this.quantity,
    this.selected,
  });
}
