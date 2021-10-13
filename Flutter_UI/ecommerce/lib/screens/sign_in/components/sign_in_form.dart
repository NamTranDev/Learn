import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String? email;
  String? password;
  bool remember = false;
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (newValue) => email = newValue,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kEmailEmptyError)) {
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
                if (input.isEmpty && !errors.contains(kEmailEmptyError)) {
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
                    padding:
                        const EdgeInsets.only(top: 15, bottom: 15, right: 15),
                    child: SvgPicture.asset('assets/icons/Mail.svg'),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              onSaved: (newValue) => password = newValue,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kPasswordEmptyError)) {
                  setState(() {
                    errors.remove(kPasswordEmptyError);
                  });
                }
                if (value.length >= 8 && errors.contains(kPasswordShortError)) {
                  setState(() {
                    errors.remove(kPasswordShortError);
                  });
                }
                return;
              },
              validator: (value) {
                var input = value ?? '';
                if (input.isEmpty && !errors.contains(kPasswordEmptyError)) {
                  setState(() {
                    errors.add(kPasswordEmptyError);
                  });
                }
                if (input.length < 8 && !errors.contains(kPasswordShortError)) {
                  setState(() {
                    errors.add(kPasswordShortError);
                  });
                }
                return;
              },
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, bottom: 15, right: 15),
                    child: SvgPicture.asset('assets/icons/Lock.svg'),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: kPrimaryColor,
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value ?? false;
                    });
                  },
                ),
                Text('Remember Me'),
                Spacer(),
                Text(
                  'Forgot Password',
                  style: TextStyle(decoration: TextDecoration.underline),
                )
              ],
            ),
            FormError(
              errors: errors,
            ),
            SizedBox(
              height: 10,
            ),
            DefaultButton(
                text: 'Continue',
                onClick: () {
                  if (_formKey.currentState?.validate() == true) {
                    _formKey.currentState?.save();
                  }
                })
          ],
        ));
  }
}
