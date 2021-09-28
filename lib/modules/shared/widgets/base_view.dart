import 'dart:ui';

import 'package:app_passagens_aereas/modules/shared/constants/image_constants.dart';
import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  BaseView({
    Key? key,
    required this.widgets,
    this.formKey,
    this.background,
  }) : super(key: key);

  final List<Widget> widgets;
  final formKey;
  final Positioned? background;
  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                widget.background ?? SizedBox(),
                Form(
                  key: widget.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.widgets,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
