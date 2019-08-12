import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './tel_input_data.dart';
import './tel_input.dart';
import 'text_field.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

abstract class TelInputViewModel extends State<TelInput> {
  String _selectedDialCode;
  String _phoneNumberHintText;
  String _phoneNumber;
  bool _includeDialCode;
  String _filter;
  final String _defaultDialCode = '+852';
  final Map<String, String> _dialCodeHintTextMapping =
      TelInputData().getDialCodeHintTextMapping();
  final List<String> _validDialCodes = TelInputData().getValidDialCode();
  TextEditingController _searchTextController = new TextEditingController();
  TextEditingController _dropDownController = new TextEditingController();
  TextEditingController _dialCodeController = new TextEditingController();
  FocusNode _inputFocusNode;

  @override
  void initState() {
    super.initState();

    _searchTextController.addListener(() {
      setState(() {
        _filter = _searchTextController.text;
      });
    });

    _selectedDialCode = ![null, false].contains(widget.dialCode)
        ? widget.dialCode
        : _defaultDialCode;

    if (!_selectedDialCode.startsWith('+')) {
      _selectedDialCode = '+' + _selectedDialCode;
    }

    if (!_validDialCodes.contains(_selectedDialCode)) {
      throw new Exception('Invalid Dial Code');
    }

    _includeDialCode =
        widget.includeDialCode == null ? false : widget.includeDialCode;

    String val = _getHintTextByDialCode();
    _updatePhoneNumberHintText(val);

    _inputFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  Widget buildTelInputField(BuildContext context) {
    return (Column( children:[
          TextField( readOnly: true,
            textAlign: TextAlign.center,
            controller: _dropDownController,
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.arrow_drop_down)
            ),
            onTap: () => _onTextPress(context),
          ),
          Row(children:[
            Container(child: MyTextField(
                  controller: _dialCodeController,
                  decoration: InputDecoration(
                      prefixText: '+',
                  )
                ),
              width:100,
              padding: EdgeInsetsDirectional.only(end:25.0),
            ),
            Expanded(child:
                  TextField(
                        onChanged: (String val) => _onTextChange(val),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: _phoneNumberHintText),
                        focusNode: _inputFocusNode,
                      ),
            )
          ])
    ])
    );;
  }

  void _onTextChange(String val) {
    _phoneNumber = val;

    if (widget.onChange is Function) {
      widget.onChange(
          _includeDialCode ? _selectedDialCode + _phoneNumber : _phoneNumber);
    }
  }

  void _updatePhoneNumberHintText(val) {
    _phoneNumberHintText = val;
  }


  void _onTextPress(BuildContext context) {
    _showCountriesDialog(context);
  }

  void _showCountriesDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(content: _buildCountriesList());
        });
  }

  Widget _buildCountriesList() {
    List<TelInputCountry> countries = TelInputData().getTelInputData();
    return Container(
        width: double.maxFinite,
        child: new Column(children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          new TextField(
            decoration: new InputDecoration(labelText: "Search Dial Code"),
            controller: _searchTextController,
          ),
          new Expanded(
            child: new ListView.builder(
              itemCount: countries.length,
              itemBuilder: (BuildContext context, int index) {
                TelInputCountry country = countries[index];
                return _filter == null || _filter == ""
                    ? _buildCountriesListTile(country)
                    : country.name.toLowerCase().contains(_filter.toLowerCase())
                        ? _buildCountriesListTile(country)
                        : new Container();
              },
            ),
          )
        ]));
  }

  Widget _buildCountriesListTile(TelInputCountry country) {
    String listTileText = '+' + country.dialCode + ' ' + country.name;
    return new ListTile(
        title: new Text(listTileText),
        onTap: () {
          setState(() {
            _selectedDialCode = '+' + country.dialCode;
          });
          _dropDownController.text = country.shortName;
          _dialCodeController.text = country.dialCode;
          String val = _getHintTextByDialCode();
          _updatePhoneNumberHintText(val);
          _inputFocusNode.unfocus();
          FocusScope.of(context).requestFocus(_inputFocusNode);
          Navigator.pop(context);
        });
  }

  String _getHintTextByDialCode() {
    return ![null, false].contains(_dialCodeHintTextMapping[_selectedDialCode])
        ? _dialCodeHintTextMapping[_selectedDialCode]
        : _dialCodeHintTextMapping[_defaultDialCode];
  }
}
