import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../helpers/constants.dart';
import '../components/custom_card_content.dart';
import '../components/custom_card_with_buttons.dart';
import '../components/reusable_card.dart';
import '../screens/results_page.dart';
import '../components/bottom_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender activeCard;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        activeCard = Gender.male;
                      });
                    },
                    cardChild: CustomCardContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    color: activeCard == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        activeCard = Gender.female;
                      });
                    },
                    cardChild: CustomCardContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    color: activeCard == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBigNumbersTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFEB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 16.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 32),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              color: kActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomCardWithButtons(
                    variable: weight,
                    variableName: 'WEIGHT',
                    actionButton1: () {
                      setState(() {
                        weight++;
                      });
                    },
                    actionButton2: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CustomCardWithButtons(
                    variable: age,
                    variableName: 'AGE',
                    actionButton1: () {
                      setState(() {
                        age++;
                      });
                    },
                    actionButton2: () {
                      setState(() {
                        age--;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            action: () {
              CalculatorBrain calculator = CalculatorBrain(height: height, weight: weight);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ResultsPage(
              bmiText: calculator.calculateBMI(),
              interpretation: calculator.getInterpretation(),
              resultText: calculator.getResult(),
            ),
          ),
        );
      },
          )
        ],
      ),
    );
  }
}
