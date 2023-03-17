import 'package:flutter/material.dart';
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
    final comingSoonTitleStyle = TextStyle(
        fontFamily: 'Cairo-Bold',
        fontSize: 20,
        color: AppTheme.primaryNavyBlue);
    return Scaffold(
      appBar: CustomAppBar(title: 'SlyList'),
      drawer: SideMenu(),
      body: Column(
        children: [
          Expanded(
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
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Servicios Populares",
                        style: popularServicesTitleStyle),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => ServiceScreen(),
                          ));
                    },
                    child: ServiceWidget(
                      serviceName: "Limpieza",
                      icon: Icons.cleaning_services,
                      color: AppTheme.secondaryBlueGray,
                      enabled: true,
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Próximamente",
                      style: comingSoonTitleStyle,
                    ),
                  ),
                  SizedBox(height: 16),
                  ServiceWidget(
                    serviceName: "Lavandería",
                    icon: Icons.local_laundry_service,
                    color: AppTheme.secondaryWine,
                    enabled: false,
                  ),
                  SizedBox(height: 16),
                  ServiceWidget(
                    serviceName: "Asesorías",
                    icon: Icons.person_search,
                    color: AppTheme.secondaryOrange,
                    enabled: false,
                  ),
                  SizedBox(height: 16),
                  ReferAFriendWidget(),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
