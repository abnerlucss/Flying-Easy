import 'package:app_passagens_aereas/modules/home/page/home_page.dart';
import 'package:app_passagens_aereas/modules/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({Key? key, required this.idPassenger})
      : super(key: key);

  final int idPassenger;
  @override
  _PaymentSuccessPageState createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pagamento",
        ),
        backgroundColor: Color(ColorConstants.darkPrimaryBlue),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 160,
            ),
            Icon(
              Icons.check_circle_outline,
              color: Color(0xFF26C378),
              size: 150,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Pagamento confirmado",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Seu comprovante será enviado no seu e-mail",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HomePage(idPassenger: widget.idPassenger),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF4B6584)),
                fixedSize: MaterialStateProperty.all(
                  Size(250, 60),
                ),
              ),
              child: Text(
                "Ver minhas passagens",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
