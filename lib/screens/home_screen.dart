import 'package:flutter/material.dart';
import 'package:slylist_app/domains/models/service.dart';
import 'package:slylist_app/data/database.dart';
import 'package:slylist_app/screens/service_screen.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/widgets/refer_a_friend_widget.dart';
import 'package:slylist_app/widgets/service_widget.dart';
import 'package:slylist_app/widgets/side_menu.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:slylist_app/app/theme.dart';
import '../data/ListIconData.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
  final Database db = Database();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _currentPosition;
  MapController _mapController = MapController();

  late List<Service> services;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    services = widget.db.initServices;
    services.sort((a, b) => b.enabled ? 1 : 0 - (a.enabled ? 1 : 0));
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
                                        builder: (builder) => ServiceScreen(
                                          service: service,
                                        ),
                                      ));
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: ServiceWidget(
                                  serviceName: service.name,
                                  icon: iconMap[service.icon] ?? Icons.error,
                                  color: Color(int.parse(
                                          service.color.substring(1),
                                          radix: 16) +
                                      0xFF000000),
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
