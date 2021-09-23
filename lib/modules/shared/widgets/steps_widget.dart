import 'package:flutter/material.dart';

class StepsWidget extends StatefulWidget {
  StepsWidget(
      {Key? key, required this.currentStep, required this.numberOfSteps})
      : super(key: key);

  final int currentStep;
  final int numberOfSteps;

  @override
  _StepsWidgetState createState() => _StepsWidgetState();
}

class _StepsWidgetState extends State<StepsWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> steps = [];

    for (var i = 1; i <= widget.numberOfSteps; i++) {
      steps.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ClipOval(
            child: Container(
              height: 12,
              width: 12,
              color: i == widget.currentStep
                  ? Color(0XFF1F2A36)
                  : Color(0XFFC5C5C5),
            ),
          ),
        ),
      );
    }

    return Row(
      children: steps,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
