import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String customText;
  final Color colour;
  final double customfontsize;
  final FontWeight customFontWeight;

  ReusableText({@required this.customText, @required this.colour, this.customFontWeight, this.customfontsize = 18.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      customText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: customFontWeight,
        color: colour,
        fontSize: customfontsize,
      ),
    );
  }
}