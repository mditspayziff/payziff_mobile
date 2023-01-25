import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnChanged = void Function(String?)?;

class RWTextFormField extends StatelessWidget {
  final String? label;
  final Icon? icon;
  final OnChanged onChanged;
  final String? helperText;
  final int? maxLength;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatters;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  const RWTextFormField({
    super.key,
    this.label,
    this.icon,
    this.onChanged,
    this.helperText,
    this.maxLength,
    this.textInputType,
    this.textInputFormatters,
    this.textCapitalization,
    this.controller
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: textInputType,
      inputFormatters: textInputFormatters,
      maxLength: maxLength,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.0,
              )
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              )
          ),
          fillColor: Colors.blue.withOpacity(0.2),
          labelStyle: const TextStyle(color: Colors.black38 ),
          labelText: label,
          helperStyle: const TextStyle(color: Colors.white ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15)
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'this field required';
        }
        return null;
      },
    );
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  });


  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.isNotEmpty) {
      if(newValue.text.length > oldValue.text.length) {
        if(newValue.text.length > mask.length) return oldValue;
        if(newValue.text.length < mask.length && mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text: '${oldValue.text}$separator${newValue.text.substring(newValue.text.length-1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}