import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'container_card.dart';
import 'gender.dart';
import 'icon_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType gender = GenderType.MALE;
  int height = 180;
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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight".toUpperCase(),
                            style: lableTextStyle,
                          ),
                          Text(
                            "80",
                            style: lableNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.remove, color: Colors.white),
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    primary: Colors.blue,
                                    onPrimary: Colors.red),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    primary: Colors.blue,
                                    onPrimary: Colors.red),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ContainerCard(
                      colour: unactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age".toUpperCase(),
                            style: lableTextStyle,
                          ),
                          Text(
                            "20",
                            style: lableNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.remove, color: Colors.white),
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    primary: Colors.blue,
                                    onPrimary: Colors.red),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.add, color: Colors.white),
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    primary: Colors.blue,
                                    onPrimary: Colors.red),
                              )
                            ],
                          )
                        ],
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
