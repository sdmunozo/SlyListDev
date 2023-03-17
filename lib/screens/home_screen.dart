import 'package:flutter/material.dart';
import 'package:slylist_app/screens/service_screen.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/widgets/refer_a_friend_widget.dart';
import 'package:slylist_app/widgets/service_widget.dart';
import 'package:slylist_app/widgets/side_menu.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _currentPosition;
  MapController _mapController = MapController();

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
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
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'SlyList'),
      drawer: SideMenu(),
      body: Column(
        children: [
          // Mapa (1/3 de la pantalla)
          Expanded(
            flex: 1,
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
                                color: Colors.red,
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

          // Contenido (2/3 de la pantalla)
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Servicios Populares",
                        style: TextStyle(
                            fontFamily: 'Cairo-Bold',
                            fontSize: 26,
                            color: Color(0xFFEC193E))),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceScreen()),
                      );
                    },
                    child: ServiceWidget(
                      serviceName: "Limpieza",
                      icon: Icons.cleaning_services,
                      color: Color(0xFF12384D),
                      enabled: true,
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Text("Próximamente",
                        style: TextStyle(
                            fontFamily: 'Cairo-Bold',
                            fontSize: 20,
                            color: Color(0xFFEC193E))),
                  ),
                  SizedBox(height: 16),
                  ServiceWidget(
                    serviceName: "Lavandería",
                    icon: Icons.local_laundry_service,
                    color: Color(0xFFEC193E),
                    enabled: false,
                  ),
                  SizedBox(height: 16),
                  ServiceWidget(
                    serviceName: "Asesorías",
                    icon: Icons.person_search,
                    color: Color(0xFFC41F4B),
                    enabled: false,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // Widget de referidos
          ReferAFriendWidget(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
