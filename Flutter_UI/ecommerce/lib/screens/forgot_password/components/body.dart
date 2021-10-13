import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/components/no_account_text.dart';
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
  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Please enter your email and we will send you a link to return to your account',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (newValue) => email = newValue,
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              errors.contains(kEmailEmptyError)) {
                            setState(() {
                              errors.remove(kEmailEmptyError);
                            });
                          }
                          if (emailValidatorRegExp.hasMatch(value) &&
                              errors.contains(kInvalidEmailError)) {
                            setState(() {
                              errors.remove(kInvalidEmailError);
                            });
                          }
                          return;
                        },
                        validator: (value) {
                          var input = value ?? '';
                          if (input.isEmpty &&
                              !errors.contains(kEmailEmptyError)) {
                            setState(() {
                              errors.add(kEmailEmptyError);
                            });
                          }
                          if (!emailValidatorRegExp.hasMatch(input) &&
                              !errors.contains(kInvalidEmailError)) {
                            setState(() {
                              errors.add(kInvalidEmailError);
                            });
                          }
                          return;
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
                      FormError(
                        errors: errors,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      DefaultButton(
                          text: 'Continue',
                          onClick: () {
                            if (_formKey.currentState?.validate() == true) {
                              _formKey.currentState?.save();
                            }
                          }),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              NoAccountText()
            ],
          ),
        ),
      ),
    );
  }
}
