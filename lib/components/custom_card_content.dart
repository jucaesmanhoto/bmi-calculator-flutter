import 'package:flutter/material.dart';
import '../helpers/constants.dart';

class CustomCardContent extends StatelessWidget {
  CustomCardContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: kIconSize,
          ),
          SizedBox(
            height: kSizedBoxHeight,
          ),
          Text(
            label,
            style: kLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
