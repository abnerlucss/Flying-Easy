import 'package:flutter/material.dart';

class DetailsButtonWidget extends StatefulWidget {
  const DetailsButtonWidget({
    Key? key,
    required this.title,
    required this.onpress,
  }) : super(key: key);

  final String title;
  final Function() onpress;

  @override
  _DetailsButtonWidgetState createState() => _DetailsButtonWidgetState();
}

class _DetailsButtonWidgetState extends State<DetailsButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 40,
        minWidth: 160,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Color(0XFFF1F1F1),
          ),
        ),
        child: Text(
          widget.title,
          style: TextStyle(color: Color(0XFF000000)),
        ),
        onPressed: widget.onpress,
      ),
    );
  }
}
