// models/address.dart

class Address {
  final String id;
  final String userId;
  final String alias;
  final String street;
  final String exteriorNumber;
  final String interiorNumber;
  final String neighborhood;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String reference;
  final bool isDefault;

  Address({
    required this.id,
    required this.userId,
    required this.alias,
    required this.street,
    required this.exteriorNumber,
    this.interiorNumber = '',
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    this.reference = '',
    this.isDefault = false,
  });
}
