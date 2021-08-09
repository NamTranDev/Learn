import 'package:bmi_calculator/data/constants.dart';
import 'package:flutter/material.dart';

import '../widget/container_content.dart';
import '../data/gender.dart';
import '../widget/icon_content.dart';
import '../widget/increase_decrease_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType gender = GenderType.MALE;
  int height = 180;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI Calculator'),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ContainerCard(
                      colour: gender == GenderType.MALE
                          ? activeColor
                          : unactiveColor,
                      cardChild: IconContent(Icons.male, "Male"),
                      onChange: () {
                        setState(() {
                          gender = GenderType.MALE;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ContainerCard(
                      colour: gender == GenderType.FEMALE
                          ? activeColor
                          : unactiveColor,
                      cardChild: IconContent(Icons.female, "Female"),
                      onChange: () {
                        setState(() {
                          gender = GenderType.FEMALE;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ContainerCard(
              colour: unactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height".toUpperCase(), style: lableTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: lableNumberStyle,
                      ),
                      Text(
                        "cm",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          trackHeight: 0.5,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20)),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                        min: 100,
                        max: 220,
                      ))
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ContainerCard(
                      colour: unactiveColor,
                      cardChild: InCreaseDecreaseContent(
                        lable: "Weight".toUpperCase(),
                        value: weight.toString(),
                        onDecrease: () {
                          setState(() {
                            if (weight == 20) return;
                            weight = weight - 1;
                          });
                        },
                        onIncrease: () {
                          setState(() {
                            if (weight == 100) return;
                            weight = weight + 1;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ContainerCard(
                      colour: unactiveColor,
                      cardChild: InCreaseDecreaseContent(
                        lable: "Age".toUpperCase(),
                        value: age.toString(),
                        onDecrease: () {
                          setState(() {
                            if (age == 10) return;
                            age = age - 1;
                          });
                        },
                        onIncrease: () {
                          setState(() {
                            if (age == 100) return;
                            age = age + 1;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10),
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Calculator BMI",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            )
          ],
        ));
  }
}
