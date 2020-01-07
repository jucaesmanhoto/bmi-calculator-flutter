import '../helpers/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kResultTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'NORMAL',
                    style: kResultTextStyle,
                  ),
                  Text(
                    '19.4',
                    style: kBMITextStyle,
                  ),
                  Padding(
                    child: Text(
                      'Your Body Mass Index is too low. You should eat more.',
                      style: kResultMessageTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ],
              ),
            ),
            flex: 5,
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            action: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}