import 'dart:ui';

import 'package:app_passagens_aereas/modules/create_account/create_account_cubit/create_account_cubit.dart';
import 'package:app_passagens_aereas/modules/home/page/home_page.dart';
import 'package:app_passagens_aereas/modules/login/login_cubit/login_state.dart';
import 'package:app_passagens_aereas/modules/onboarding/onboarding_page.dart';
import 'package:app_passagens_aereas/modules/shared/util/basic_state_enum.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/base_view.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/blue_button.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/spacing_txt_fields.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/steps_widget.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasicCreateAccount extends StatefulWidget {
  const BasicCreateAccount({
    Key? key,
    required this.textFields,
    required this.blueButtonText,
    required this.whiteButtonText,
    required this.txtFieldController1,
    required this.txtFieldController2,
    this.txtFieldController3,
    required this.onTap,
    required this.onTapFailed,
    required this.urlImgBackground,
    required this.currentStep,
  }) : super(key: key);

  final Column textFields;
  final String blueButtonText;
  final String whiteButtonText;
  final TextEditingController txtFieldController1;
  final TextEditingController txtFieldController2;
  final TextEditingController? txtFieldController3;
  final String urlImgBackground;
  final Function() onTap;
  final Function() onTapFailed;
  final int currentStep;

  @override
  _BasicCreateAccountState createState() => _BasicCreateAccountState();
}

class _BasicCreateAccountState extends State<BasicCreateAccount> {
  final _formKey = GlobalKey<FormState>();

  void setIdPassenger(int idPassenger) async {
    SharedPreferences accountPrefs = await SharedPreferences.getInstance();
    accountPrefs.setInt('idPassenger', idPassenger);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAccountCubit, LoginState>(
      listener: (context, state) {
        if (state.state == BasicStateEnum.success) {
          setIdPassenger(state.idPassenger!);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                idPassenger: state.idPassenger!,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.state == BasicStateEnum.load) {
          load();
        }
        return BaseView(
          background: Positioned.fill(
            child: Image(
              image: AssetImage(widget.urlImgBackground),
              alignment: Alignment.topCenter,
              height: 100,
            ),
          ),
          formKey: _formKey,
          widgets: [
            SizedBox(
              height: .18 * MediaQuery.of(context).size.height,
            ),
            StepsWidget(
              numberOfSteps: 3,
              currentStep: widget.currentStep,
            ),
            SizedBox(
              height: .14 * MediaQuery.of(context).size.height,
            ),
            widget.textFields,
            SizedBox(
              height: .10 * MediaQuery.of(context).size.height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 150, height: 40),
                    child: WhiteButton(
                      buttonText: widget.whiteButtonText,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                SizedBox(
                  width: 10,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 150, height: 40),
                  child: BlueButton(
                    buttonText: widget.blueButtonText,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        widget.onTapFailed();
                      } else {
                        widget.onTap();
                      }
                    },
                  ),
                ),
              ],
            ),
            SpacingTextFormFields(),
          ],
        );
      },
    );
  }
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
