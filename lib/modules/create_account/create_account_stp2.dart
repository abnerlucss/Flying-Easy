import 'package:app_passagens_aereas/modules/create_account/create_account_stp3.dart';
import 'package:app_passagens_aereas/modules/create_account/widgets/basic_create_account.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/custom_txt_field.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/spacing_txt_fields.dart';
import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'models/create_account_model.dart';

final maskCpf = MaskTextInputFormatter(
    mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

final maskTel = new MaskTextInputFormatter(
    mask: '+## (##) # ####-####', filter: {"#": RegExp(r'[0-9]')});

class CreateAccountStep2Page extends StatefulWidget {
  const CreateAccountStep2Page({Key? key, required this.createAccountModel})
      : super(key: key);

  final CreateAccountModel createAccountModel;

  @override
  _CreateAccountStep2PageState createState() => _CreateAccountStep2PageState();
}

class _CreateAccountStep2PageState extends State<CreateAccountStep2Page> {
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasicCreateAccount(
        onTap: () {
          widget.createAccountModel.cpf = cpfController.text;
          widget.createAccountModel.email = emailController.text;
          widget.createAccountModel.phone = phoneController.text;

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateAccountStep3Page(
                        createAccountModel: widget.createAccountModel,
                      )));
        },
        txtFieldController1: cpfController,
        txtFieldController2: emailController,
        txtFieldController3: phoneController,
        titleTextStep: "Etapa 2 de 3",
        textFields: Column(
          children: [
            CustomTextField(
              controller: cpfController,
              formatter: maskCpf,
              labelTextField: "CPF",
              hintText: "123.123.123-12",
              textInputType: TextInputType.number,
              validator: (text) {
                if (text!.isEmpty) return "O CPF não pode ser nulo";
              },
            ),
            SpacingTextFormFields(),
            CustomTextField(
              controller: emailController,
              hintText: "joao@adress.com",
              labelTextField: "Email",
              textInputType: TextInputType.emailAddress,
              validator: (text) {
                if (text!.isEmpty) return "O email não pode ser nulo";
              },
            ),
            SpacingTextFormFields(),
            CustomTextField(
              controller: phoneController,
              hintText: "+55 (11) 9 9876-5432",
              formatter: maskTel,
              labelTextField: "Telefone",
              textInputType: TextInputType.phone,
              validator: (text) {
                if (text!.isEmpty) return "O telefone não pode ser nulo";
              },
            ),
          ],
        ),
        blueButtonText: "Próximo",
        whiteButtonText: "Voltar");
  }
}
