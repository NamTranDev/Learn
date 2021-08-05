import 'package:flutter/material.dart';

const colorPress = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                    child: ContainerCard(colorPress),
                  ),
                  Expanded(
                    child: ContainerCard(colorPress),
                  )
                ],
              ),
            ),
            Expanded(child: ContainerCard(colorPress)),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ContainerCard(colorPress),
                  ),
                  Expanded(
                    child: ContainerCard(colorPress),
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

class ContainerCard extends StatelessWidget {
  ContainerCard(@required this.colour);

  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: colour, borderRadius: BorderRadius.circular(5)),
    );
  }
}
