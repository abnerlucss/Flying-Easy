import 'package:app_passagens_aereas/modules/create_account/create_account_cubit/create_account_cubit.dart';
import 'package:app_passagens_aereas/modules/create_account/create_account_stp1.dart';
import 'package:app_passagens_aereas/modules/login/login_cubit/login_cubit.dart';
import 'package:app_passagens_aereas/modules/login/models/login_model.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/base_view.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/custom_txt_field.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/custom_txt_field_password.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/util/basic_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'onboarding_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;

  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final loginModel = LoginModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, BasicStateEnum>(
      listener: (context, state) {
        if (state == BasicStateEnum.success) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OnboardingPage()));
        }
        if (state == BasicStateEnum.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login e/ou senha inválidos')),
          );
        }
      },
      builder: (context, state) {
        if (state == BasicStateEnum.load) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: Color(0xFF4B6584),
              ),
            ),
          );
        }
        return BaseView(
          formKey: _formKey,
          widgets: [
            Center(child: Image.asset("assets/travel.png", width: 280)),
            SizedBox(
              height: 45,
            ),
            Center(
              child: Text(
                "Passagens Aéreas",
                style: TextStyle(
                    color: Color(0xFF4B6584),
                    fontSize: 35,
                    fontFamily: "Open Sans"),
              ),
            ),
            SizedBox(
              height: 55,
            ),
            Column(
              children: [
                CustomTextField(
                    formatter: maskCpf,
                    labelTextField: "CPF",
                    textInputType: TextInputType.number,
                    controller: loginController),
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
              ],
            ),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 166, height: 41),
                child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Preencha todos os campos')),
                      );
                    } else {
                      loginModel.cpf = loginController.text;
                      loginModel.senha = passwordController.text;

                      print(loginModel);

                      BlocProvider.of<LoginCubit>(context)
                          .postLogin(loginModel);
                    }
                  },
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
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF4B6584)),
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
          ],
        );
      },
    );
  }
}
