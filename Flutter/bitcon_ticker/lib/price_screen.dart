import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currentCurrency = currenciesList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
                backgroundColor: Colors.red,
                itemExtent: 32,
                onSelectedItemChanged: (selectedIndex) {},
                children: getPickerItems()),
          ),
        ],
      ),
    );
  }
}

List<Widget> getPickerItems() {
  List<Text> items = [];
  currenciesList.forEach((element) {
    items.add(Text(element));
  });
  return items;
}

List<DropdownMenuItem> getDropdownItems() {
  List<DropdownMenuItem<String>> items = [];
  currenciesList.forEach((element) {
    items.add(DropdownMenuItem(
      child: Text(element),
      value: element,
    ));
  });
  return items;
}
