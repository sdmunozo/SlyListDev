import 'package:slylist_app/models/address.dart';
import 'package:slylist_app/models/payment_method.dart';
import 'package:slylist_app/models/user.dart';
import 'package:slylist_app/models/document.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  final String referralCode;
  final bool acceptTerms;
  final String type;
  final String photo;
  final String defaultAddress;
  final List<Address> addresses;
  final String defaultPaymentMethod;
  final List<PaymentMethod> paymentMethods;
  final List<String> scheduledServices;
  final List<String> completedServices;
  final List<Document> documents;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
    required this.referralCode,
    required this.acceptTerms,
    required this.type,
    required this.photo,
    required this.defaultAddress,
    required this.addresses,
    required this.defaultPaymentMethod,
    required this.paymentMethods,
    required this.scheduledServices,
    required this.completedServices,
    required this.documents,
  });
}
