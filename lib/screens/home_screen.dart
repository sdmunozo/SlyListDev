import 'package:flutter/material.dart';
import 'package:slylist_app/models/service_model.dart';
import 'package:slylist_app/screens/service_screen.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/widgets/refer_a_friend_widget.dart';
import 'package:slylist_app/widgets/service_widget.dart';
import 'package:slylist_app/widgets/side_menu.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:slylist_app/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _currentPosition;
  MapController _mapController = MapController();

  final List<Service> services = [
    Service(
      id: "1",
      name: "Limpieza",
      icon: Icons.cleaning_services,
      color: Color(0xFF228B22),
      enabled: true,
      baseCost: 100,
      quantityFeatures: [],
      selectionFeatures: [],
      features: [],
      date: DateTime.now(),
      time: "10:00 AM",
      paymentMethod: "Tarjeta",
    ),
    Service(
      id: "2",
      name: "Lavandería",
      icon: Icons.local_laundry_service,
      color: Color(0xFF800080),
      enabled: false,
      baseCost: 50,
      quantityFeatures: [],
      selectionFeatures: [],
      features: [],
      date: DateTime.now(),
      time: "11:00 AM",
      paymentMethod: "Efectivo",
    ),
    Service(
      id: "3",
      name: "Asesorías",
      icon: Icons.person_search,
      color: Color(0xFF8B0000),
      enabled: false,
      baseCost: 150,
      quantityFeatures: [],
      selectionFeatures: [],
      features: [],
      date: DateTime.now(),
      time: "12:00 PM",
      paymentMethod: "Tarjeta",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        _currentPosition = position;
        _mapController.move(
            LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            16.5);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final popularServicesTitleStyle = TextStyle(
        fontFamily: 'Cairo-Bold',
        fontSize: 26,
        color: AppTheme.primaryNavyBlue);

    return Scaffold(
      appBar: CustomAppBar(title: 'SlyList'),
      drawer: SideMenu(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                        center: _currentPosition != null
                            ? LatLng(_currentPosition!.latitude,
                                _currentPosition!.longitude)
                            : LatLng(25.651081, -100.289558),
                        zoom: 16.5),
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerLayerOptions(
                        markers: _currentPosition != null
                            ? [
                                Marker(
                                  width: 80.0,
                                  height: 80.0,
                                  point: LatLng(_currentPosition!.latitude,
                                      _currentPosition!.longitude),
                                  builder: (ctx) => Container(
                                    child: Icon(
                                      Icons.location_on,
                                      color: AppTheme.primaryRed,
                                      size: 60.0,
                                    ),
                                  ),
                                ),
                              ]
                            : [],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("Servicios Populares",
                      style: popularServicesTitleStyle),
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...services.map((service) => GestureDetector(
                              onTap: () {
                                if (service.enabled) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => ServiceScreen(),
                                      ));
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: ServiceWidget(
                                  serviceName: service.name,
                                  icon: service.icon,
                                  color: service.color,
                                  enabled: service.enabled,
                                ),
                              ),
                            )),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ReferAFriendWidget(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
