class Address {
  final String id;
  final String alias;
  final String street;
  final String exteriorNumber;
  final String interiorNumber;
  final String neighborhood;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  bool isDefault;

  Address({
    required this.id,
    required this.alias,
    required this.street,
    required this.exteriorNumber,
    required this.interiorNumber,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.isDefault = false,
  });
}
