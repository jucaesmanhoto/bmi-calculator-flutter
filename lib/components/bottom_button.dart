import 'package:flutter/material.dart';
import '../helpers/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({@required this.buttonTitle, @required this.action});

  final String buttonTitle;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: kCalculateButtonTextStyle,
        )),
        color: kBottonContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 16.0),
      ),
    );
  }
}