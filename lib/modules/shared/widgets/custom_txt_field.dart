import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.labelTextField,
      required this.textInputType,
      this.validator,
      this.formatter,
      this.hintText,
      required this.controller})
      : super(key: key);

  final String labelTextField;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final MaskTextInputFormatter? formatter;
  final String? hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelTextField,
          style: TextStyle(fontSize: 20),
        ),
        Container(
          decoration: new BoxDecoration(
              color: Color(0XFFE2E2E2),
              borderRadius: new BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: controller,
              inputFormatters: formatter == null ? null : [formatter!],
              autovalidateMode: AutovalidateMode.disabled,
              validator: validator,
              cursorColor: Color(0xFF4B6584),
              keyboardType: textInputType,
              decoration: InputDecoration(
                hintText: hintText,
                errorStyle: TextStyle(fontSize: 1, height: 0),
                border: InputBorder.none,
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF4B6584),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}