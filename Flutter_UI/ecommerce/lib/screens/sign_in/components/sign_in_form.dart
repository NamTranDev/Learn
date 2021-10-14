import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
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
  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
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
                    Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  }
                })
          ],
        ));
  }

  String? addError(String error) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
      return '';
    }
  }

  void removeError(String error) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  TextFormField buildEmailForm() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kEmailEmptyError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(kInvalidEmailError);
        }
      },
      validator: (value) {
        var isValid = null;
        var input = value ?? '';
        if (input.isEmpty) {
          return addError(kEmailEmptyError);
        }
        if (!emailValidatorRegExp.hasMatch(input)) {
          return addError(kInvalidEmailError);
        }
        return isValid;
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
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kPasswordEmptyError);
        }
        if (value.length >= 8) {
          removeError(kPasswordShortError);
        }
      },
      validator: (value) {
        var isValid = null;
        var input = value ?? '';
        if (input.isEmpty) {
          return addError(kPasswordEmptyError);
        }
        if (input.length < 8) {
          return addError(kPasswordShortError);
        }
        return isValid;
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
