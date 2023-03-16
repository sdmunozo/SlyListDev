class Address {
  String alias;
  String street;
  String city;
  String state;
  String zipCode;
  String country;
  bool isDefault;

  Address({
    required this.alias,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    this.isDefault = false,
  });
}
