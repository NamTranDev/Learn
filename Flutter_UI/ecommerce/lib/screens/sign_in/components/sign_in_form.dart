import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/screens/login_success/login_success_screen.dart';
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
  var validateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidateMode: validateMode,
        child: Column(
          children: [
            buildEmailForm(),
            SizedBox(
              height: 20,
            ),
            buildPasswordForm(),
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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName);
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DefaultButton(
                text: 'Continue',
                onClick: () {
                  if (_formKey.currentState?.validate() == true) {
                    Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  } else {
                    setState(() {
                      validateMode = AutovalidateMode.onUserInteraction;
                    });
                  }
                })
          ],
        ));
  }

  TextFormField buildEmailForm() {
    return TextFormField(
      textInputAction: TextInputAction.next,
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
            padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
            child: SvgPicture.asset('assets/icons/Mail.svg'),
          )),
    );
  }

  TextFormField buildPasswordForm() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        var input = value ?? '';
        if (input.isEmpty) {
          return kPasswordEmptyError;
        }
        if (input.length < 8) {
          return kPasswordShortError;
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
            child: SvgPicture.asset('assets/icons/Lock.svg'),
          )),
    );
  }
}
