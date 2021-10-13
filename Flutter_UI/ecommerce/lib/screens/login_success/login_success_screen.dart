import 'package:ecommerce/components/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = '/login_success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text('Login Success'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Image.asset('assets/images/success.png'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Text(
            "Login Success",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: DefaultButton(text: 'Back to home', onClick: () {}),
          )
        ],
      ),
    );
  }
}
