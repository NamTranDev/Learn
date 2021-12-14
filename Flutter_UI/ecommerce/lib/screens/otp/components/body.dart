import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/top_text_authen.dart';
import 'package:ecommerce/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'otp_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const TopTextAuthen(
                  titleHeader: 'OTP Verification',
                  title: 'We sent your code to +84 1234567 ***'),
              buildTimer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              OtpForm(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'Resend OTP Code',
                style: TextStyle(decoration: TextDecoration.underline),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('This code will expire in '),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            '00:${timer(value)}',
            style: const TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        )
      ],
    );
  }

  String timer(var value) {
    if (value is double) {
      int time = value.toInt();
      if (time < 10) {
        return '0$time';
      } else {
        return time.toString();
      }
    }
    return '00';
  }
}
