import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/reusable_text.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.resultInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              customPaddingValue: 8.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ReusableText(
                    customText: resultText,
                    colour: Colors.green,
                    customfontsize: 22.0,
                    customFontWeight: FontWeight.bold,
                  ),
                  ReusableText(
                    customText: bmiResult,
                    colour: Colors.white,
                    customfontsize: 100.0,
                    customFontWeight: FontWeight.bold,
                  ),
                  ReusableText(
                    customText:
                        resultInterpretation,
                    colour: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonTitle: 'RE-CALCULATE'),
          ),
        ],
      ),
    );
  }
}
