// ... Importa otros archivos de datos de prueba aquí
import 'package:slylist_app/data/mock_data/init_services.dart';
import 'package:slylist_app/domains/models/service.dart';
import 'mock_data/services.dart';

class Database {
  static final Database _singleton = Database._internal();

  // Datos de prueba
  //List<Services> mockService = ;
  List<Service> services = mockServices;
  List<Service> initServices = mockInitServices;
  //List<Service> services = mockServices;
  // ... Agrega las demás listas de datos aquí

  factory Database() {
    return _singleton;
  }

  Database._internal();
}
