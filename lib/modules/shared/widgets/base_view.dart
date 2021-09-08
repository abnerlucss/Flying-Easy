import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
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
      ),
    );
  }
}
