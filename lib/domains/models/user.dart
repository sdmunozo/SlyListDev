// models/user.dart
import 'package:slylist_app/domains/models/requested_service.dart';
import 'package:slylist_app/domains/models/uploaded_document.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;
  final String referralCode;
  final double slyCash;
  final bool slyTermsAccepted;
  final String defaultPaymentMethodId;
  final String defaultAddressId;
  final List<UploadedDocument> slyerDocuments;
  final List<RequestedService> slyRequestedService;
  final List<RequestedService> slyerProviderService;
  final bool isSlyer;
  final bool slyerTermsAccepted;
  final String slyerStatus;
  final bool slyerApproved;

  User({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.email = '',
    this.password = '',
    this.referralCode = '',
    this.slyCash = 0.0,
    this.slyerStatus = 'N/A',
    this.slyTermsAccepted = false,
    this.slyerTermsAccepted = false,
    this.isSlyer = false,
    this.slyerDocuments = const [],
    this.slyerApproved = false,
    this.defaultPaymentMethodId = '',
    this.defaultAddressId = '',
    this.slyRequestedService = const [],
    this.slyerProviderService = const [],
  });
}
