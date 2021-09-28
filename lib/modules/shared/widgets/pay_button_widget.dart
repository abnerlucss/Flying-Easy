import 'package:app_passagens_aereas/modules/home/models/flight_model.dart';
import 'package:flutter/material.dart';

class PayButtonWidget extends StatefulWidget {
  const PayButtonWidget({
    Key? key,
    required this.title,
    required this.onpress,
    required this.seatClass,
    required this.flightModel,
  }) : super(key: key);

  final String title;
  final Function() onpress;
  final String seatClass;
  final FlightModel flightModel;

  @override
  _PayButtonWidgetState createState() => _PayButtonWidgetState();
}

class _PayButtonWidgetState extends State<PayButtonWidget> {
  double setPrice(String? titleClass) {
    double price;
    switch (titleClass) {
      case "Econômica":
        price = widget.flightModel.precoEconomica;
        break;

      case "Executiva":
        price = widget.flightModel.precoExecutiva;
        break;
      default:
        price = widget.flightModel.precoPrimeiraClasse;
    }

    return price;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 90,
        minWidth: 200,
      ),
      child: ElevatedButton(
        onPressed: widget.onpress,
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
        child: Column(
          children: [
            Text(
              "R\$ ${setPrice(widget.seatClass)}",
              style: TextStyle(
                fontSize: 19,
                color: Color(
                  0XFF000000,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(3),
                ),
                color: Color(0XFF26C378),
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Color(0XFFFFFFFF),
                  fontSize: 19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
