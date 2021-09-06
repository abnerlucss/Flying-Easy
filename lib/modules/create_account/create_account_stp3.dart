import 'package:app_passagens_aereas/modules/create_account/models/create_account_model.dart';
import 'package:app_passagens_aereas/modules/create_account/widgets/basic_create_account.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/custom_txt_field_password.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/spacing_txt_fields.dart';
import 'package:flutter/material.dart';

class CreateAccountStep3Page extends StatefulWidget {
  const CreateAccountStep3Page({Key? key, required this.createAccountModel})
      : super(key: key);

  final CreateAccountModel createAccountModel;

  @override
  _CreateAccountStep3PageState createState() => _CreateAccountStep3PageState();
}

class _CreateAccountStep3PageState extends State<CreateAccountStep3Page> {
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasicCreateAccount(
        onTap: () {
          widget.createAccountModel.password = passwordController.text;
        },
        onTapFailed: () {
          if (passwordController.text.isEmpty ||
              passwordConfirmationController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Preencha todos os campos')),
            );
          } else if (passwordController.text !=
              passwordConfirmationController.text) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('As senhas não coincidem')),
            );
          }
        },
        txtFieldController1: passwordController,
        txtFieldController2: passwordConfirmationController,
        titleTextStep: "Etapa 3 de 3",
        textFields: Column(
          children: [
            CustomTextFieldPassword(
              controller: passwordController,
              labelTextField: "Crie uma senha",
              validator: (text) {
                if (text!.isEmpty) return "";
              },
            ),
            SpacingTextFormFields(),
            CustomTextFieldPassword(
              controller: passwordConfirmationController,
              labelTextField: "Confirme a senha",
              validator: (text) {
                if (text!.isEmpty || passwordController.text != text) return "";
              },
            )
          ],
        ),
        blueButtonText: "Concluir",
        whiteButtonText: "Voltar");
  }
}
