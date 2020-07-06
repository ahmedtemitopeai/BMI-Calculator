import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget child;
  final double customPaddingValue;

  ReusableCard({@required this.colour, this.child, @required this.customPaddingValue});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: colour,
      ),
      padding: EdgeInsets.symmetric(vertical: customPaddingValue),
      child: child,
    );
  }
}
