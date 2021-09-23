import 'package:flutter/material.dart';

class GreenButtonWidget extends StatelessWidget {
  const GreenButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Color(0XFF26C378),
        ),
      ),
    );
  }
}
