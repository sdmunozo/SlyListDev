import 'package:flutter/material.dart';
import 'package:slylist_app/screens/address_screen.dart';
import 'package:slylist_app/widgets/checkbox_widget.dart';
import 'package:slylist_app/widgets/custom_app_bar_widget.dart';
import 'package:slylist_app/app/theme.dart';
import 'package:slylist_app/widgets/large_button_widget.dart';
import 'package:slylist_app/widgets/text_form_field_widget.dart';

class EditAddressScreen extends StatefulWidget {
  final Address? address;
  final Function(Address) onSave;
  final bool isNew;

  EditAddressScreen({this.address, required this.onSave, this.isNew = false});

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
    _aliasController.text = widget.address?.alias ?? '';
    _streetController.text = widget.address?.street ?? '';
    _cityController.text = widget.address?.city ?? '';
    _stateController.text = widget.address?.state ?? '';
    _zipCodeController.text = widget.address?.zipCode ?? '';
    _countryController.text = widget.address?.country ?? '';
    _isDefault = widget.address?.isDefault ?? false;
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

  Widget _buildTextFormField(String labelText, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTheme.lightTheme.textTheme.bodyText1,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.primaryNavyBlue,
            width: 2.0,
          ),
        ),
      ),
      keyboardType: keyboardType,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.isNew ? 'Nueva dirección' : 'Editar dirección',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormFieldWidget(
                labelText: 'Alias', controller: _aliasController),
            SizedBox(height: 10),
            TextFormFieldWidget(
                labelText: 'Calle y número', controller: _streetController),
            SizedBox(height: 10),
            TextFormFieldWidget(
                labelText: 'Ciudad', controller: _cityController),
            SizedBox(height: 10),
            TextFormFieldWidget(
                labelText: 'Estado', controller: _stateController),
            SizedBox(height: 10),
            TextFormFieldWidget(
                labelText: 'Código postal',
                controller: _zipCodeController,
                keyboardType: TextInputType.number),
            SizedBox(height: 10),
            TextFormFieldWidget(
                labelText: 'País', controller: _countryController),
            SizedBox(height: 10),
            CheckboxWidget(
              labelText: 'Establecer como dirección predeterminada',
              value: _isDefault,
              onChanged: (bool? value) {
                _isDefault = value ?? false;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: LargeButtonWidget(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      buttonText: 'Cancelar',
                      fontSize: 20,
                      colorOption: ButtonColorOption.option3,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: LargeButtonWidget(
                      onPressed: () {
                        Address newAddress = Address(
                          alias: _aliasController.text,
                          street: _streetController.text,
                          city: _cityController.text,
                          state: _stateController.text,
                          zipCode: _zipCodeController.text,
                          country: _countryController.text,
                          isDefault: _isDefault,
                        );
                        widget.onSave(newAddress);
                        Navigator.pop(context);
                      },
                      buttonText: 'Guardar',
                      fontSize: 20,
                      colorOption: ButtonColorOption.option1,
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
