import 'tel_input.dart';
import 'package:flutter/material.dart';
class TelFormField extends FormField<String>
{
  TelFormField({
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    String dialCode,
    bool autovalidate = false
  }) : super(
    onSaved: onSaved,
    validator: validator,
    autovalidate: autovalidate,
    builder: (FormFieldState<String> state) {
      return Column(
        children:[
          TelInput(
            dialCode: dialCode,
            onChange: (phone)=>state.didChange(phone),
          ),
          state.hasError?
              Text(
                state.errorText,
                style: TextStyle(
                    color: Colors.red
                ),
              ) :
              Container(),
        ]
      );
    }
   );
}