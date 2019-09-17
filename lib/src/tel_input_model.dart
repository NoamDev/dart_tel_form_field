import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './tel_input_data.dart';
import './tel_input.dart';
import 'text_field.dart';
import 'package:states_rebuilder/states_rebuilder.dart';


abstract class TelInputViewModel extends State<TelInput> {
  String _selectedDialCode;
  String _phoneNumber;
  final String _defaultDialCode = '972';

  final List<String> _validDialCodes = TelInputData().getValidDialCode();
  final Map<String,String> _dialCodeCountryNameMapping =
      TelInputData().getDialCodeCountryNameMapping();
  TextEditingController _searchTextController = new TextEditingController();
  TextEditingController _dropDownController = new TextEditingController();
  TextEditingController _dialCodeController = new TextEditingController();
  ListRebuilder bloc = new ListRebuilder();
  FocusNode _inputFocusNode;

  @override
  void initState() {
    super.initState();

    _searchTextController.addListener(() {
        bloc.filter(_searchTextController.text);
    });

    _selectedDialCode = ![null, false].contains(widget.dialCode)
        ? widget.dialCode
        : _defaultDialCode;

    _dialCodeController.text = _selectedDialCode;
    _dropDownController.text = _dialCodeCountryNameMapping[_selectedDialCode] ?? "invalid country code";

    _dialCodeController.addListener(() {
      var code = _dialCodeController.text;
      if(_selectedDialCode != code) {
        _selectedDialCode = code;
        _dropDownController.text = _dialCodeCountryNameMapping[_selectedDialCode] ?? "invalid country code";
        _onTextChange(code, _phoneNumber);
      }
    });


    if (!_validDialCodes.contains(_selectedDialCode)) {
      throw new Exception('Invalid Dial Code');
    }


    _inputFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _dropDownController.dispose();
    _dialCodeController.dispose();
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
                  ),
                  keyboardType: TextInputType.phone,
                ),
              width:100,
              padding: EdgeInsetsDirectional.only(end:25.0),
            ),
            Expanded(child:
                  TextField(
                        onChanged: (String val) => _onTextChange(_selectedDialCode,val),

                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(hintText: "phone number"),
                        focusNode: _inputFocusNode,
                      ),
            )
          ])
    ])
    );
  }

  void _onTextChange(dialCode,phoneNumber) {
    _phoneNumber = phoneNumber;

    if (widget.onChange is Function) {
      widget.onChange('+'+_selectedDialCode + (_phoneNumber??''));
    }
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
            child: StateBuilder(
              viewModels: [bloc],
              tag:"countries_list",
              builder: (_,__)=> new ListView.builder(
                itemCount: countries.length,
                itemBuilder: (BuildContext context, int index) {
                  TelInputCountry country = countries[index];
                  return bloc._filter == null || bloc._filter == ""
                      ? _buildCountriesListTile(country)
                      : country.name.toLowerCase().contains(bloc._filter.toLowerCase())
                      ? _buildCountriesListTile(country)
                      : new Container();
                },
              )
            ),
          )
        ]));
  }

  Widget _buildCountriesListTile(TelInputCountry country) {
    String listTileText = '+' + country.dialCode + ' ' + country.name;
    return new ListTile(
        title: new Text(listTileText),
        onTap: () {
          _dropDownController.text = country.shortName;
          _dialCodeController.text = country.dialCode;
          _inputFocusNode.unfocus();
          FocusScope.of(context).requestFocus(_inputFocusNode);
          Navigator.pop(context);
        });
  }


}
class ListRebuilder extends StatesRebuilder{
  String _filter = "";
  filter(String filter){
    if(filter != _filter)
    {
      _filter = filter;
      rebuildStates(["countries_list"]);
    }
  }
}
