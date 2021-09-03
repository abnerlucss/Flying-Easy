import 'package:flutter/material.dart';

class CustomTextFieldPassword extends StatefulWidget {
  const CustomTextFieldPassword(
      {Key? key,
      required this.labelTextField,
      this.validator,
      required this.controller})
      : super(key: key);

  final String labelTextField;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  _CustomTextFieldPasswordState createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelTextField,
          style: TextStyle(fontSize: 20),
        ),
        Container(
          decoration: new BoxDecoration(
              color: Color(0XFFE2E2E2),
              borderRadius: new BorderRadius.circular(8.0)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              controller: widget.controller,
              autovalidateMode: AutovalidateMode.disabled,
              validator: widget.validator,
              cursorColor: Color(0xFF4B6584),
              obscureText: obscureText,
              decoration: InputDecoration(
                errorStyle: TextStyle(fontSize: 1, height: 0),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.remove_red_eye,
                    color: Color(0xFF4B6584),
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
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
