import 'package:app_passagens_aereas/modules/create_account/create_account_cubit/create_account_cubit.dart';
import 'package:app_passagens_aereas/modules/create_account/create_account_cubit/create_account_enum.dart';
import 'package:app_passagens_aereas/modules/login/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseView extends StatelessWidget {
  BaseView({Key? key, required this.widgets, this.formKey}) : super(key: key);

  final List<Widget> widgets;
  final formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<CreateAccountCubit, CreateAccountEnum>(
        listener: (context, state) {
          if (state == CreateAccountEnum.success) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OnboardingPage()));
          }
        },
        builder: (context, state) {
          print(state);
          if (state == CreateAccountEnum.load) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Color(0xFF4B6584),
              ),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widgets,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
