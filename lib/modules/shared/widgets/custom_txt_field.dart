import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelTextField,
    required this.textInputType,
    this.validator,
    this.formatter,
    this.hintText,
    required this.controller,
    this.focusNode,
  }) : super(key: key);

  final String labelTextField;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final MaskTextInputFormatter? formatter;
  final String? hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelTextField,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              color: Color(0XFFF1F1F1),
              borderRadius: new BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                focusNode: focusNode,
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
      ),
    );
  }
}
