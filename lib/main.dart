import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BmiApp());

class BmiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF04040C),
        scaffoldBackgroundColor: Color(0xFF040426).withOpacity(0.9),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: InputPage(),
      ),
    );
  }
}
