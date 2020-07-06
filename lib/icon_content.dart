import 'package:flutter/material.dart';
import 'reusable_text.dart';

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String textLabel;

  IconContent({@required this.iconData, @required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(height: 20.0),
        ReusableText(customText: textLabel, colour: Colors.white),
      ],
    );
  }
}
