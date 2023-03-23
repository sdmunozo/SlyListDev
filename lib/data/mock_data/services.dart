import 'package:slylist_app/domains/models/service.dart';
import './features.dart';

List<Service> mockServices = [
  Service(
    id: "1",
    name: "Limpieza",
    icon: "cleaning_services",
    enabled: true,
    text: "¿Qué limpiaremos por ti?",
    color: "#ADD8E6",
    features: [mockFeatures[0], mockFeatures[1], mockFeatures[2]],
  ),
  Service(
    id: "2",
    name: "Asesorías",
    icon: "pool",
    color: "#E8F8F5",
    text: "¡Te ayudaremos con todas tus dudas!",
    enabled: true,
    features: [mockFeatures[3], mockFeatures[4], mockFeatures[5]],
  ),
  Service(
    id: "3",
    name: "Service 3",
    icon: "local_florist",
    enabled: true,
    color: "#FADADD",
    features: [mockFeatures[6], mockFeatures[7], mockFeatures[8]],
  ),
  Service(
    id: "4",
    name: "Service 4",
    icon: "clean_hands",
    color: "#C1E1C1",
    features: [mockFeatures[0], mockFeatures[0], mockFeatures[1]],
  ),
  Service(
    id: "5",
    name: "Service 5",
    icon: "fireplace",
    color: "#F2D7EE",
    features: [mockFeatures[2], mockFeatures[3], mockFeatures[4]],
  ),
  Service(
    id: "6",
    name: "Service 6",
    icon: "ac_unit",
    enabled: true,
    color: "#FFDAB9",
    features: [mockFeatures[5], mockFeatures[6], mockFeatures[7]],
  ),
  Service(
    id: "7",
    name: "Service 7",
    icon: "water_damage",
    color: "#B0E0E6",
    features: [mockFeatures[8], mockFeatures[0], mockFeatures[0]],
  ),
  Service(
    id: "8",
    name: "Service 8",
    icon: "room",
    color: "#F5DEB3",
    features: [mockFeatures[1], mockFeatures[2], mockFeatures[3]],
  ),
  Service(
    id: "9",
    name: "Service 9",
    icon: "sports_handball",
    enabled: true,
    color: "#D8BFD8",
    features: [mockFeatures[4], mockFeatures[5], mockFeatures[6]],
  ),
  Service(
    id: "10",
    name: "Service 10",
    icon: "euro",
    color: "#E0FFFF",
    features: [mockFeatures[7], mockFeatures[8], mockFeatures[0]],
  )
];
