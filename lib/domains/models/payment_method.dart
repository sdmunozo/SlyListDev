// models/payment_method.dart

class PaymentMethod {
  final String id;
  final String userId;
  final PaymentType type;
  final String cardNumber;
  final String cardHolderName;
  final String expirationDate;
  final String cvv;
  final String paypalEmail;

  PaymentMethod({
    required this.id,
    required this.userId,
    required this.type,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expirationDate,
    required this.cvv,
    required this.paypalEmail,
  });
}

// payment_type.dart
enum PaymentType {
  cash,
  paypal,
  creditCard,
  debitCard,
  slycash,
}
