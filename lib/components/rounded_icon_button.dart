import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({@required this.action, @required this.icon});

  final IconData icon;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        action();
      },
      elevation: 6.0,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4f5E),
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
    );
  }
}
