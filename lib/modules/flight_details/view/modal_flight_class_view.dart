import 'package:app_passagens_aereas/modules/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ModalFlightClassView extends StatefulWidget {
  const ModalFlightClassView({
    Key? key,
    this.onChanged,
    required this.titleClass,
  }) : super(key: key);

  final String titleClass;

  @override
  _ModalFlightClassViewState createState() => _ModalFlightClassViewState();

  final void Function(String? value)? onChanged;
}

class _ModalFlightClassViewState extends State<ModalFlightClassView> {
  String? _character;

  @override
  void initState() {
    super.initState();
    _character = widget.titleClass;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Selecione a classe",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("Econômica"),
              trailing: Radio<String>(
                activeColor: Color(ColorConstants.darkPrimaryBlue),
                value: "Econômica",
                groupValue: _character,
                onChanged: (String? value) {
                  changeOption(value);
                },
              ),
            ),
            ListTile(
              title: Text("Executiva"),
              trailing: Radio<String>(
                value: "Executiva",
                activeColor: Color(ColorConstants.darkPrimaryBlue),
                groupValue: _character,
                onChanged: (String? value) {
                  changeOption(value);
                },
              ),
            ),
            ListTile(
              title: Text("Primeira Classe"),
              trailing: Radio<String>(
                activeColor: Color(ColorConstants.darkPrimaryBlue),
                value: "Primeira Classe",
                groupValue: _character,
                onChanged: (String? value) {
                  changeOption(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeOption(String? value) {
    widget.onChanged!(value);
    setState(() {
      _character = value;
    });
    Navigator.pop(context);
  }
}
