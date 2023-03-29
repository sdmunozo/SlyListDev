// ... Importa otros archivos de datos de prueba aquí

import 'package:slylist_app/data/mock/services_mock.dart';
import 'package:slylist_app/domains/models/service.dart';

class Database {
  static final Database _singleton = Database._internal();

  // Datos de prueba
  //List<Services> mockService = ;
  //List<Service> services = mockServices;
  List<Service> initServices = services;
  //List<Service> services = mockServices;
  // ... Agrega las demás listas de datos aquí

  factory Database() {
    return _singleton;
  }

  Database._internal();
}
