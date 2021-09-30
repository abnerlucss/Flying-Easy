import 'package:app_passagens_aereas/modules/create_account/create_account_stp1.dart';
import 'package:app_passagens_aereas/modules/home/page/home_page.dart';
import 'package:app_passagens_aereas/modules/login/login_cubit/login_cubit.dart';
import 'package:app_passagens_aereas/modules/login/login_cubit/login_state.dart';
import 'package:app_passagens_aereas/modules/login/models/login_model.dart';
import 'package:app_passagens_aereas/modules/shared/constants/image_constants.dart';
import 'package:app_passagens_aereas/modules/shared/util/basic_state_enum.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/base_view.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/custom_txt_field.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/custom_txt_field_password.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        checkState(state, context);
      },
      builder: (context, state) {
        if (state == LoginState.load()) {
          return load();
        }
        return BaseView(
          formKey: _formKey,
          background: Positioned.fill(
            child: Image(
              image: AssetImage(ImagesConstants.loginCircles),
              alignment: Alignment.bottomCenter,
              height: 100,
            ),
          ),
          widgets: [
            SizedBox(
              height: .1 * MediaQuery.of(context).size.height,
            ),
            Center(
              child: Image.asset(
                ImagesConstants.homeLogo,
                height: .3 * MediaQuery.of(context).size.height,
                width: 400,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                CustomTextField(
                  formatter: maskCpf,
                  labelTextField: "CPF",
                  textInputType: TextInputType.number,
                  controller: loginController,
                ),
                SizedBox(
                  height: .05 * MediaQuery.of(context).size.height,
                ),
                CustomTextFieldPassword(
                  controller: passwordController,
                  labelTextField: "Senha",
                  validator: (text) {
                    if (text!.isEmpty) return "A senha não pode ser nula";
                  },
                ),
                SizedBox(
                  height: .08 * MediaQuery.of(context).size.height,
                ),
              ],
            ),
            Center(
              child: WhiteButton(
                buttonText: "Entrar",
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    onTapFailed(context);
                  } else {
                    onTap(context);
                  }
                },
              ),
            ),
            SizedBox(
              height: .02 * MediaQuery.of(context).size.height,
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
            ),
            SizedBox(
              height: .20 * MediaQuery.of(context).size.height,
            ),
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
          backgroundColor: Color(0xFF1F2A36),
        ),
      ),
    );
  }

  void checkState(LoginState state, BuildContext context) async {
    if (state.state == BasicStateEnum.success) {
      SharedPreferences loginPrefs = await SharedPreferences.getInstance();
      loginPrefs.setInt('idPassenger', state.idPassenger!);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            idPassenger: state.idPassenger!,
          ),
        ),
      );
    } else if (state.state == BasicStateEnum.failed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login e/ou senha inválidos')),
      );
    }
  }
}
