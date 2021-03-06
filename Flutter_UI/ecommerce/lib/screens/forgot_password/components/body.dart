import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/no_account_text.dart';
import 'package:ecommerce/components/top_text_authen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? email;
  final _formKey = GlobalKey<FormState>();
  var validateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopTextAuthen(
                  titleHeader: 'Forgot Password',
                  title:
                      'Please enter your email and we will send you a link to return to your account'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Form(
                  key: _formKey,
                  autovalidateMode: validateMode,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (newValue) => email = newValue,
                        validator: (value) {
                          var input = value ?? '';
                          if (input.isEmpty) {
                            return kEmailEmptyError;
                          }
                          if (!emailValidatorRegExp.hasMatch(input)) {
                            return kInvalidEmailError;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, right: 15),
                              child: SvgPicture.asset('assets/icons/Mail.svg'),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      DefaultButton(
                          text: 'Continue',
                          onClick: () {
                            if (_formKey.currentState?.validate() == true) {
                            } else {
                              setState(() {
                                validateMode =
                                    AutovalidateMode.onUserInteraction;
                              });
                            }
                          }),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const NoAccountText()
            ],
          ),
        ),
      ),
    );
  }
}
