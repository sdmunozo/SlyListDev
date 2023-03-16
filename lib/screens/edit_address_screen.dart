import 'package:flutter/material.dart';
import 'package:slylist_app/screens/address_screen.dart';

class EditAddressScreen extends StatefulWidget {
  final Address address;

  EditAddressScreen({required this.address});

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final TextEditingController _aliasController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  bool _isDefault = false;

  @override
  void initState() {
    super.initState();
    _aliasController.text = widget.address.alias;
    _streetController.text = widget.address.street;
    _cityController.text = widget.address.city;
    _stateController.text = widget.address.state;
    _zipCodeController.text = widget.address.zipCode;
    _countryController.text = widget.address.country;
    _isDefault = widget.address.isDefault;
  }

  @override
  void dispose() {
    _aliasController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar dirección', style: appTheme.textTheme.headline6),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _aliasController,
              decoration: InputDecoration(
                labelText: 'Alias',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _streetController,
              decoration: InputDecoration(
                labelText: 'Calle y número',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Ciudad',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _stateController,
              decoration: InputDecoration(
                labelText: 'Estado',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _zipCodeController,
              decoration: InputDecoration(
                labelText: 'Código postal',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _countryController,
              decoration: InputDecoration(
                labelText: 'País',
              ),
            ),
            SizedBox(height: 10),
            CheckboxListTile(
              title: Text('Establecer como dirección predeterminada'),
              value: _isDefault,
              onChanged: (bool? value) {
                setState(() {
                  _isDefault = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancelar',
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'Cairo-Bold'),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).errorColor,
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: ElevatedButton(
                      onPressed: () {
// Implementar la funcionalidad de guardar dirección aquí
                      },
                      child: Text(
                        'Guardar',
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'Cairo-Bold'),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: appTheme.primaryColor,
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
