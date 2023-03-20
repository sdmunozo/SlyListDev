class Service {
  final String id;
  final String name;
  final String icon;
  final String color;
  final bool disabled;
  final double cost;
  final List<dynamic> items;
  final String client_id;
  final String provider_id;
  final String address_id;
  final String payment_method_id;
  final DateTime scheduled_datetime;
  final DateTime completed_datetime;
  final double client_rating;
  final double provider_rating;
  final String client_comments;
  final String provider_comments;
  final String status;

  Service({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.disabled,
    required this.cost,
    required this.items,
    required this.client_id,
    required this.provider_id,
    required this.address_id,
    required this.payment_method_id,
    required this.scheduled_datetime,
    required this.completed_datetime,
    required this.client_rating,
    required this.provider_rating,
    required this.client_comments,
    required this.provider_comments,
    required this.status,
  });
}
