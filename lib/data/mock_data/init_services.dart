import 'package:slylist_app/domains/models/service.dart';
import './init_features.dart';

List<Service> mockInitServices = [
  Service(
    id: "1",
    name: "Limpieza",
    icon: "cleaning_services",
    enabled: true,
    text: "¿Qué limpiaremos por ti?",
    color: "#ADD8E6",
    baseCost: 450,
    baseFeatures: 4,
    priority: PriorityType.cost,
    features: [
      mockInitFeatures[0],
      mockInitFeatures[1],
      mockInitFeatures[2],
      mockInitFeatures[3],
      mockInitFeatures[4]
    ],
  ),
  Service(
    id: "2",
    name: "Asesorías",
    icon: "pool",
    color: "#E8F8F5",
    text: "¡Te ayudaremos con todas tus dudas!",
    enabled: true,
    features: [mockInitFeatures[3], mockInitFeatures[4], mockInitFeatures[5]],
  ),
  Service(
    id: "3",
    name: "Service 3",
    icon: "local_florist",
    enabled: true,
    color: "#FADADD",
    features: [mockInitFeatures[6], mockInitFeatures[7], mockInitFeatures[8]],
  ),
  Service(
    id: "4",
    name: "Service 4",
    icon: "clean_hands",
    color: "#C1E1C1",
    features: [mockInitFeatures[0], mockInitFeatures[0], mockInitFeatures[1]],
  ),
  Service(
    id: "5",
    name: "Service 5",
    icon: "fireplace",
    color: "#F2D7EE",
    features: [mockInitFeatures[2], mockInitFeatures[3], mockInitFeatures[4]],
  ),
  Service(
    id: "6",
    name: "Service 6",
    icon: "ac_unit",
    enabled: true,
    color: "#FFDAB9",
    features: [mockInitFeatures[5], mockInitFeatures[6], mockInitFeatures[7]],
  ),
  Service(
    id: "7",
    name: "Service 7",
    icon: "water_damage",
    color: "#B0E0E6",
    features: [mockInitFeatures[8], mockInitFeatures[0], mockInitFeatures[0]],
  ),
  Service(
    id: "8",
    name: "Service 8",
    icon: "room",
    color: "#F5DEB3",
    features: [mockInitFeatures[1], mockInitFeatures[2], mockInitFeatures[3]],
  ),
  Service(
    id: "9",
    name: "Service 9",
    icon: "sports_handball",
    enabled: true,
    color: "#D8BFD8",
    features: [mockInitFeatures[4], mockInitFeatures[5], mockInitFeatures[6]],
  ),
  Service(
    id: "10",
    name: "Service 10",
    icon: "euro",
    color: "#E0FFFF",
    features: [mockInitFeatures[7], mockInitFeatures[8], mockInitFeatures[0]],
  )
];
