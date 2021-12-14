import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/screens/home/main_screen.dart';
import 'package:ecommerce/storage/preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  TextEditingController pin1Controler = TextEditingController();
  TextEditingController pin2Controler = TextEditingController();
  TextEditingController pin3Controler = TextEditingController();
  TextEditingController pin4Controler = TextEditingController();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  bool nextFocus(
      String value, FocusNode? focus, TextEditingController controler) {
    if (value.length > 1) {
      controler.text = value[0];
      controler.selection = TextSelection.fromPosition(TextPosition(offset: 1));
      return false;
    }
    if (value.length == 1) {
      focus?.requestFocus();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildInputOtp(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          DefaultButton(
              text: 'Continue',
              onClick: () {
                Preference.instance.storeLogin(true);
                Navigator.pushNamedAndRemoveUntil(
                    context, MainScreen.routeName, (_) => false);
              })
        ],
      ),
    );
  }

  Row buildInputOtp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 60,
          child: TextFormField(
            textInputAction: TextInputAction.done,
            controller: pin1Controler,
            style: TextStyle(
              fontSize: 24,
            ),
            obscureText: true,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: otpDecoration,
            onChanged: (value) {
              nextFocus(value, pin2FocusNode, pin1Controler);
            },
          ),
        ),
        SizedBox(
          width: 60,
          child: TextFormField(
            textInputAction: TextInputAction.done,
            controller: pin2Controler,
            focusNode: pin2FocusNode,
            style: TextStyle(
              fontSize: 24,
            ),
            obscureText: true,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: otpDecoration,
            onChanged: (value) {
              nextFocus(value, pin3FocusNode, pin2Controler);
            },
          ),
        ),
        SizedBox(
          width: 60,
          child: TextFormField(
            textInputAction: TextInputAction.done,
            controller: pin3Controler,
            focusNode: pin3FocusNode,
            style: TextStyle(
              fontSize: 24,
            ),
            obscureText: true,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: otpDecoration,
            onChanged: (value) {
              nextFocus(value, pin4FocusNode, pin3Controler);
            },
          ),
        ),
        SizedBox(
          width: 60,
          child: TextFormField(
            textInputAction: TextInputAction.done,
            controller: pin4Controler,
            focusNode: pin4FocusNode,
            style: TextStyle(
              fontSize: 24,
            ),
            obscureText: true,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: otpDecoration,
            onChanged: (value) {
              if (nextFocus(value, null, pin4Controler)) {
                pin4FocusNode.unfocus();
              }
            },
          ),
        ),
      ],
    );
  }
}
