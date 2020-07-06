import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_text.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 74;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Gender Container
          Row(
            children: <Widget>[
              // Start of Male Container
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor.withOpacity(0.3)
                          : cardColor,
                      customPaddingValue: 20.0,
                      child: IconContent(
                        iconData: FontAwesomeIcons.mars,
                        textLabel: 'MALE',
                      ),
                    ),
                  ),
                ),
              ),
              // End of Male Container
              // Start of Female Container
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor.withOpacity(0.3)
                          : cardColor,
                      customPaddingValue: 20.0,
                      child: IconContent(
                        iconData: FontAwesomeIcons.venus,
                        textLabel: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ),
              // End of female container
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          // Start of height container
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ReusableCard(
              colour: cardColor,
              customPaddingValue: 16.0,
              child: Column(
                children: <Widget>[
                  ReusableText(
                    customText: 'HEIGHT',
                    colour: Colors.white54,
                    customfontsize: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: <Widget>[
                      ReusableText(
                        customText: height.toString(),
                        colour: Colors.white,
                        customFontWeight: FontWeight.w900,
                        customfontsize: 48.0,
                      ),
                      ReusableText(
                        customText: 'cm',
                        colour: Colors.white54,
                        customfontsize: 22.0,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // End of height container
          SizedBox(
            height: 20.0,
          ),
          // Start of the weight and age container
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ReusableCard(
                      colour: cardColor,
                      customPaddingValue: 20.0,
                      child: Column(
                        children: <Widget>[
                          ReusableText(
                            customText: 'WEIGHT',
                            colour: Colors.white,
                          ),
                          SizedBox(height: 20.0),
                          ReusableText(
                            customText: weight.toString(),
                            colour: Colors.white,
                            customfontsize: 42.0,
                            customFontWeight: FontWeight.w900,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ReusableCard(
                      colour: cardColor,
                      customPaddingValue: 20.0,
                      child: Column(
                        children: <Widget>[
                          ReusableText(
                            customText: 'AGE',
                            colour: Colors.white,
                            customfontsize: 18.0,
                          ),
                          SizedBox(height: 20.0),
                          ReusableText(
                            customText: age.toString(),
                            colour: Colors.white,
                            customFontWeight: FontWeight.w900,
                            customfontsize: 42.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    resultInterpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
