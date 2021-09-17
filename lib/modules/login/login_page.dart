import 'package:app_passagens_aereas/modules/create_account/create_account_stp1.dart';
import 'package:app_passagens_aereas/modules/login/login_cubit/login_cubit.dart';
import 'package:app_passagens_aereas/modules/login/models/login_model.dart';
import 'package:app_passagens_aereas/modules/shared/constants/image_constants.dart';
import 'package:app_passagens_aereas/modules/shared/util/basic_state_enum.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/base_view.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/custom_txt_field.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/custom_txt_field_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../onboarding/onboarding_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;

  final maskCpf = MaskTextInputFormatter(
    mask: "###.###.###-##",
    filter: {"#": RegExp(r'[0-9]')},
  );

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final loginModel = LoginModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, BasicStateEnum>(
      listener: (context, state) {
        checkState(state, context);
      },
      builder: (context, state) {
        if (state == BasicStateEnum.load) {
          return load();
        }
        return BaseView(
          background: Image(
            image: AssetImage(ImagesConstants.loginCircles),
            fit: BoxFit.contain,
            height: 350,
            width: 500,
            alignment: Alignment.bottomCenter,
          ),
          formKey: _formKey,
          widgets: [
            Center(
              child: Image.asset(
                ImagesConstants.homeLogo,
                width: 600,
              ),
            ),
            Column(
              children: [
                CustomTextField(
                    formatter: maskCpf,
                    labelTextField: "CPF",
                    textInputType: TextInputType.number,
                    controller: loginController),
                SizedBox(
                  height: 60,
                ),
                CustomTextFieldPassword(
                  controller: passwordController,
                  labelTextField: "Senha",
                  validator: (text) {
                    if (text!.isEmpty) return "A senha não pode ser nula";
                  },
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 166, height: 41),
                child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      onTapFailed(context);
                    } else {
                      onTap(context);
                    }
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0XFF000000),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0XFFF1F1F1)),
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
                      builder: (context) => CreateAccountStep1Page(),
                    ),
                  );
                },
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void onTap(BuildContext context) {
    loginModel.cpf = loginController.text;
    loginModel.senha = passwordController.text;

    print(loginModel);

    BlocProvider.of<LoginCubit>(context).postLogin(loginModel);
  }

  void onTapFailed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Preencha todos os campos'),
      ),
    );
  }

  Scaffold load() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Color(0xFF4B6584),
        ),
      ),
    );
  }

  void checkState(BasicStateEnum state, BuildContext context) {
    if (state == BasicStateEnum.success) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnboardingPage()));
    } else if (state == BasicStateEnum.failed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login e/ou senha inválidos')),
      );
    }
  }
}
