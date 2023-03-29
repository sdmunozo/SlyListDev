import 'package:slylist_app/data/mock/features_mock.dart';
import 'package:slylist_app/domains/models/service.dart';

List<Service> services = [
  Service(
    id: "1",
    name: "Limpieza",
    icon: "cleaning_services",
    enabled: true,
    text: "¿Qué limpiaremos por ti?",
    color: "#ADD8E6",
    features: [features[0], features[1], features[2]],
  ),
  Service(
    id: "2",
    name: "Asesorías",
    icon: "pool",
    color: "#E8F8F5",
    text: "¡Te ayudaremos con todas tus dudas!",
    enabled: true,
    features: [features[3], features[4], features[5]],
  ),
  Service(
    id: "3",
    name: "Service 3",
    icon: "local_florist",
    enabled: true,
    color: "#FADADD",
    features: [features[6], features[7], features[8]],
  ),
  Service(
    id: "4",
    name: "Service 4",
    icon: "clean_hands",
    color: "#C1E1C1",
    features: [features[0], features[0], features[1]],
  ),
  Service(
    id: "5",
    name: "Service 5",
    icon: "fireplace",
    color: "#F2D7EE",
    features: [features[2], features[3], features[4]],
  ),
  Service(
    id: "6",
    name: "Service 6",
    icon: "ac_unit",
    enabled: true,
    color: "#FFDAB9",
    features: [features[5], features[6], features[7]],
  ),
  Service(
    id: "7",
    name: "Service 7",
    icon: "water_damage",
    color: "#B0E0E6",
    features: [features[8], features[0], features[0]],
  ),
  Service(
    id: "8",
    name: "Service 8",
    icon: "room",
    color: "#F5DEB3",
    features: [features[1], features[2], features[3]],
  ),
  Service(
    id: "9",
    name: "Service 9",
    icon: "sports_handball",
    enabled: true,
    color: "#D8BFD8",
    features: [features[4], features[5], features[6]],
  ),
  Service(
    id: "10",
    name: "Service 10",
    icon: "euro",
    color: "#E0FFFF",
    features: [features[7], features[8], features[0]],
  )
];
