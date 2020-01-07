import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import '../helpers/constants.dart';
import 'rounded_icon_button.dart';

class CustomCardWithButtons extends StatelessWidget {
  CustomCardWithButtons({this.variable, this.variableName, this.actionButton1, this.actionButton2});

  final int variable;
  final String variableName;
  final Function actionButton1;
  final Function actionButton2;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            variableName,
            style: kLabelTextStyle,
          ),
          Text(
            variable.toString(),
            style: kBigNumbersTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedIconButton(
                icon: FontAwesomeIcons.plus,
                action: actionButton1,
              ),
              SizedBox(
                width: 8.0,
              ),
              RoundedIconButton(
                icon: FontAwesomeIcons.minus,
                action: actionButton2,
                
              )
            ],
          )
        ],
      ),
      color: kActiveCardColor,
    );
  }
}
