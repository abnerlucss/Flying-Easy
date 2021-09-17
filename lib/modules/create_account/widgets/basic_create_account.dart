import 'dart:ui';

import 'package:app_passagens_aereas/modules/create_account/create_account_cubit/create_account_cubit.dart';
import 'package:app_passagens_aereas/modules/onboarding/onboarding_page.dart';
import 'package:app_passagens_aereas/modules/shared/util/basic_state_enum.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/base_view.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/blue_button.dart';
import 'package:app_passagens_aereas/modules/shared/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicCreateAccount extends StatefulWidget {
  const BasicCreateAccount({
    Key? key,
    required this.titleTextStep,
    required this.textFields,
    required this.blueButtonText,
    required this.whiteButtonText,
    required this.txtFieldController1,
    required this.txtFieldController2,
    this.txtFieldController3,
    required this.onTap,
    required this.onTapFailed,
  }) : super(key: key);

  final String titleTextStep;
  final Column textFields;
  final String blueButtonText;
  final String whiteButtonText;
  final TextEditingController txtFieldController1;
  final TextEditingController txtFieldController2;
  final TextEditingController? txtFieldController3;
  final Function() onTap;
  final Function() onTapFailed;

  @override
  _BasicCreateAccountState createState() => _BasicCreateAccountState();
}

class _BasicCreateAccountState extends State<BasicCreateAccount> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAccountCubit, BasicStateEnum>(
        listener: (context, state) {
      if (state == BasicStateEnum.success) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OnboardingPage()));
      }
    }, builder: (context, state) {
      if (state == BasicStateEnum.load) {
        return BaseView(
          widgets: [
            Center(
              child: CircularProgressIndicator(
                backgroundColor: Color(0xFF4B6584),
              ),
            )
          ],
        );
      }
      return BaseView(
        formKey: _formKey,
        widgets: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              widget.titleTextStep,
              style: TextStyle(color: Color(0xFF4B6584), fontSize: 36),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          widget.textFields,
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 150, height: 40),
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
                    }),
              ),
            ],
          )
        ],
      );
    });
  }
}
