import 'package:flutter/material.dart';
import 'package:slylist_app/screens/edit_address_screen.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';

class Address {
  final String alias;
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final bool isDefault;

  Address({
    required this.alias,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    this.isDefault = false,
  });
}

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final List<Address> _addresses = [
    Address(
      alias: 'Departamento',
      street: 'Calle del Sol 123, Apt. 4B',
      city: 'Ciudad de la Luz',
      state: 'Estado Dorado',
      zipCode: '12345',
      country: 'País Maravilloso',
      isDefault: true,
    ),
    Address(
      alias: 'Casa Mamá',
      street: 'Avenida de la Luna 456, Casa 8',
      city: 'Villa Estelar',
      state: 'Región Celestial',
      zipCode: '67890',
      country: 'Reino Estelar',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Direcciones'),
      body: ListView.builder(
        itemCount: _addresses.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildAddressCard(_addresses[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewAddress,
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _navigateToEditAddressScreen(
      {required Address address,
      required bool isNew,
      required Function(Address) onSave}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditAddressScreen(
          address: address,
          isNew: isNew,
          onSave: onSave,
        ),
      ),
    );
  }

  void _openAddressEditor(Address address) {
    _navigateToEditAddressScreen(
      address: address,
      isNew: false,
      onSave: (newAddress) {
        setState(() {
          int index = _addresses.indexOf(address);
          _addresses[index] = newAddress;
        });
      },
    );
  }

  void _addNewAddress() {
    _navigateToEditAddressScreen(
      address: Address(
          alias: '', street: '', city: '', state: '', zipCode: '', country: ''),
      isNew: true,
      onSave: (newAddress) {
        setState(() {
          _addresses.add(newAddress);
        });
      },
    );
  }

  Widget _buildAddressCard(Address address) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          print('Seleccionar dirección ${address.street}');
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.alias,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      address.street,
                      style: TextStyle(fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                '${address.city}, ${address.state}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '${address.zipCode}, ${address.country}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (address.isDefault)
                    Chip(
                      label: Text('Predeterminada'),
                      backgroundColor: Theme.of(context).accentColor,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  SizedBox(width: 10),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditAddressScreen(
                            address: address,
                            onSave: (newAddress) {
                              setState(() {
                                int index = _addresses.indexOf(address);
                                _addresses[index] = newAddress;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    icon:
                        Icon(Icons.edit, color: Theme.of(context).primaryColor),
                    label: Text(
                      'Editar',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
