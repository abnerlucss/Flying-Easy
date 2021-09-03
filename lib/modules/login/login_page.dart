import 'package:app_passagens_aereas/modules/create_account/create_account_stp1.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/base_view.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/custom_txt_field_password.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView(widgets: [
      Center(child: Image.asset("assets/travel.png", width: 280)),
      SizedBox(
        height: 45,
      ),
      Center(
        child: Text(
          "Passagens Aéreas",
          style: TextStyle(
              color: Color(0xFF4B6584), fontSize: 35, fontFamily: "Open Sans"),
        ),
      ),
      SizedBox(
        height: 55,
      ),
      Text(
        "CPF",
        style: TextStyle(fontSize: 20),
      ),
      Container(
        decoration: new BoxDecoration(
            color: Color(0XFFE2E2E2),
            borderRadius: new BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: loginController,
            cursorColor: Color(0xFF4B6584),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: TextStyle(
                fontSize: 20,
                color: Color(0xFF4B6584),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 45,
      ),
      CustomTextFieldPassword(
        controller: passwordController,
        labelTextField: "Senha",
        validator: (text) {
          if (text!.isEmpty) return "A senha não pode ser nula";
        },
      ),
      SizedBox(
        height: 50,
      ),
      Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 166, height: 41),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Entrar",
              style: TextStyle(fontSize: 18),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Color(0xFF4B6584)),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 25,
      ),
      Center(
          child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccountStep1Page()));
              },
              child: Text(
                "Cadastre-se",
                style: TextStyle(fontSize: 18),
              )))
    ]);
  }
}
