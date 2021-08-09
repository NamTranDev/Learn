import 'package:bmi_calculator/conculator_brain.dart';
import 'package:bmi_calculator/data/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.bmi);

  final CalculatorBrain bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(bmi.bmiComment().toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFF24D876))),
                  Text(
                    bmi.bmiResult(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                        color: Colors.white),
                  ),
                  Text(bmi.bmiInterpretation(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.white))
                ],
              ),
            )),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                color: Color(0xFFEB1555),
                child: Center(
                  child: Text(
                    "Re-Calculate",
                    style: lableButtonStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
