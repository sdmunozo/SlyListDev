import 'package:slylist_app/data/mock/requested_service_mock.dart';
import 'package:slylist_app/domains/models/user.dart';

final List<User> users = [
  User(
    id: '1',
    firstName: 'John',
    lastName: 'Doe',
    phoneNumber: '1234567890',
    email: 'johndoe@gmail.com',
    password: 'password',
    slyTermsAccepted: true,
    defaultPaymentMethodId: '1',
    defaultAddressId: '1',
    slyRequestedService: requestedServices,
  ),
  User(
    id: '2',
    firstName: 'Jane',
    lastName: 'Doe',
    phoneNumber: '9876543210',
    email: 'janedoe@gmail.com',
    password: 'password',
    slyTermsAccepted: true,
    defaultPaymentMethodId: '2',
    defaultAddressId: '2',
    slyRequestedService: requestedServices,
  ),
  User(
    id: '3',
    firstName: 'Bob',
    lastName: 'Smith',
    phoneNumber: '5555555555',
    email: 'bobsmith@gmail.com',
    password: 'password',
    slyTermsAccepted: true,
    defaultPaymentMethodId: '3',
    defaultAddressId: '3',
    slyRequestedService: requestedServices,
  ),
];
