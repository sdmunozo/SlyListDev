import 'package:slylist_app/models/feature.dart';

List<Feature> mockInitFeatures = [
  Feature(
    id: "1",
    type: FeatureType.quantity,
    icon: "bed",
    name: "Cuartos",
    cost: 100,
    isIncludedInBaseCost: true,
    baseQuantityIncluded: 2,
  ),
  Feature(
    id: "2",
    type: FeatureType.quantity,
    icon: "bathtub",
    name: "Baños",
    cost: 120,
    weight: 1.5,
    isIncludedInBaseCost: true,
    baseQuantityIncluded: 2,
  ),
  Feature(
    id: "3",
    type: FeatureType.quantity,
    icon: "weekend",
    name: "Áreas Comunes",
    note: "(Sala,Comedor...)",
    cost: 130,
    isIncludedInBaseCost: false,
    baseQuantityIncluded: 2,
  ),
  Feature(
    id: "4",
    type: FeatureType.selection,
    icon: "cleaning_services",
    name: "Limpieza Profunda",
    note: "Fiestas, suciedad acumulada.",
    cost: 200,
    isIncludedInBaseCost: true,
  ),
  Feature(
    id: "5",
    type: FeatureType.selection,
    icon: "icon5.png",
    name: "Feature 5",
    note: "Note for Feature 5",
    cost: 350,
    isIncludedInBaseCost: true,
  ),
  Feature(
    id: "6",
    type: FeatureType.quantity,
    icon: "icon6.png",
    name: "Feature 6",
    note: "Note for Feature 6",
    cost: 2.49,
  ),
  Feature(
    id: "7",
    type: FeatureType.selection,
    icon: "icon7.png",
    name: "Feature 7",
    note: "Note for Feature 7",
    cost: 1.49,
  ),
  Feature(
    id: "8",
    type: FeatureType.quantity,
    icon: "icon8.png",
    name: "Feature 8",
    note: "Note for Feature 8",
    cost: 0.49,
  ),
  Feature(
    id: "9",
    type: FeatureType.selection,
    icon: "icon9.png",
    name: "Feature 9",
    note: "Note for Feature 9",
    cost: 5.99,
  ),
  Feature(
    id: "10",
    type: FeatureType.quantity,
    icon: "icon10.png",
    name: "Feature 10",
    note: "Note for Feature 10",
    cost: 3.99,
  ),
];
