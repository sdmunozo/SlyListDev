import 'package:flutter/material.dart';
import 'package:slylist_app/widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF142449),
        title: Text(
          'SlyList',
          style: TextStyle(fontFamily: 'SohoGothicPro-Bold', fontSize: 24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              TextFormField(
                controller: _searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Buscar proveedores de servicios de limpieza',
                  labelStyle: TextStyle(fontFamily: 'Cairo-Regular'),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),
              // Aquí puede agregar el código para mostrar los resultados de la búsqueda
            ],
          ),
        ),
      ),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(Icons.menu),
        );
      }),
      // Agrega el SideMenu al atributo drawer de Scaffold
      drawer: SideMenu(),
    );
  }
}
