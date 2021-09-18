import 'package:app_passagens_aereas/modules/login/login_page.dart';
import 'package:flutter/material.dart';

class BasicOboarding extends StatefulWidget {
  const BasicOboarding(
      {Key? key, required this.urlImage, required this.bannerText})
      : super(key: key);

  final String urlImage;
  final String bannerText;

  @override
  _BasicOboardingState createState() => _BasicOboardingState();
}

class _BasicOboardingState extends State<BasicOboarding> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image(
            image: AssetImage(widget.urlImage),
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "X",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 25,
                    ),
                  )),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              widget.bannerText,
              style: TextStyle(
                  color: Color(0XFFFFFFFF),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
