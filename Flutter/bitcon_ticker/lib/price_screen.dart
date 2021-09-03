import 'dart:io';

import 'package:bitcoin_ticker/service/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Controller controller = Controller();
  Map<String, CoinData> coinValues = {};

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> items = [];
    currenciesList.forEach((element) {
      items.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return DropdownButton(
        value: controller.currentCurrency,
        items: items,
        onChanged: (value) {
          if (controller.updateData(value)) getData();
        });
  }

  CupertinoPicker iosPicker() {
    List<Text> items = [];
    currenciesList.forEach((element) {
      items.add(Text(element));
    });
    return CupertinoPicker(
        backgroundColor: Colors.red,
        itemExtent: 32,
        onSelectedItemChanged: (selectedIndex) {
          if (controller.updateData(currenciesList[selectedIndex])) getData();
        },
        children: items);
  }

  Widget getView() {
    if (Platform.isIOS) {
      return iosPicker();
    }
    return androidDropDown();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Map<String, CoinData> cryptoData = await controller.getData();
    setState(() {
      coinValues = cryptoData;
    });
  }

  Column makeCards() {
    List<Widget> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = ${value(crypto)} ${currency(crypto)}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  String value(crypto) {
    return coinValues[crypto] == null ? "?" : coinValues[crypto].value ?? "?";
  }

  String currency(crypto) {
    return coinValues[crypto] == null
        ? controller.currentCurrency
        : coinValues[crypto].currency ?? controller.currentCurrency;
  }

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
            child: makeCards(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getView(),
          ),
        ],
      ),
    );
  }
}
