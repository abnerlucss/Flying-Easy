import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  const WhiteButton({Key? key, required this.buttonText, this.onPressed})
      : super(key: key);

  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 41,
        minWidth: 160,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4B6584),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
