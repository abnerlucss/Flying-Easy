import 'package:app_passagens_aereas/modules/create_account/create_account_stp2.dart';
import 'package:app_passagens_aereas/modules/create_account/widgets/basic_create_account.dart';
import 'package:app_passagens_aereas/modules/shared/constants/image_constants.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/custom_txt_field.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/spacing_txt_fields.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'models/create_account_model.dart';

final maskDate = new MaskTextInputFormatter(
    mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

class CreateAccountStep1Page extends StatefulWidget {
  const CreateAccountStep1Page({Key? key}) : super(key: key);

  @override
  _CreateAccountStep1PageState createState() => _CreateAccountStep1PageState();
}

class _CreateAccountStep1PageState extends State<CreateAccountStep1Page> {
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final createAccountModel = CreateAccountModel();

  @override
  Widget build(BuildContext context) {
    return BasicCreateAccount(
      urlImgBackground: ImagesConstants.createAccountBackground1,
      onTap: () {
        createAccountModel.name = nameController.text;
        createAccountModel.birthDate = dateController.text;

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateAccountStep2Page(
                      createAccountModel: createAccountModel,
                    )));
      },
      onTapFailed: () {
        if (nameController.text.isEmpty || dateController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Preencha todos os campos')),
          );
        }
      },
      txtFieldController1: nameController,
      txtFieldController2: dateController,
      titleTextStep: "Etapa 1 de 3",
      whiteButtonText: "Voltar",
      blueButtonText: "Próximo",
      textFields: Column(
        children: [
          CustomTextField(
            controller: nameController,
            formatter: null,
            labelTextField: "Nome Completo",
            textInputType: TextInputType.name,
            validator: (text) {
              if (text!.isEmpty) return "";
            },
          ),
          SpacingTextFormFields(),
          CustomTextField(
            controller: dateController,
            // hintText: "00/00/0000",
            formatter: maskDate,
            labelTextField: "Data de nascimento",
            textInputType: TextInputType.datetime,
            validator: (text) {
              if (text!.isEmpty) return "";
            },
          ),
        ],
      ),
    );
  }
}
