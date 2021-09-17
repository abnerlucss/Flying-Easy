import 'dart:ui';

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
  final Widget? background;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  double size = 0;
  @override
  void initState() {
    super.initState();
  }

  EdgeInsets _getViewInsets() {
    final window = WidgetsBinding.instance!.window;
    return EdgeInsets.fromWindowPadding(
      window.viewInsets,
      window.devicePixelRatio,
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = EdgeInsets.fromWindowPadding(
        window.viewInsets, window.devicePixelRatio);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          print(viewInsets);
          print(constraints.biggest.height);

          if (size == 0.0) {
            size = constraints.maxHeight;
          }

          print(size);

          return Container(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: constraints.maxHeight + _getViewInsets().bottom,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          widget.background ?? SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: widget.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.widgets,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
