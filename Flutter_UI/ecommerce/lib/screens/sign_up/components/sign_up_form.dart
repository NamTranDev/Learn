import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String? email;
  String? password;
  String? confirm_password;
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
              height: 20,
            ),
            buildRePasswordForm(),
            SizedBox(
              height: 10,
            ),
            FormError(
              errors: errors,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
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
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kPasswordEmptyError);
        }
        if (value.length >= 8) {
          removeError(kPasswordShortError);
        }
        password = value;
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

  TextFormField buildRePasswordForm() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kPasswordEmptyError);
        }
        if (value == password) {
          removeError(kPasswordMatchError);
        }
      },
      validator: (value) {
        var isValid = null;
        var input = value ?? '';
        if (input != password) {
          return addError(kPasswordMatchError);
        }

        return isValid;
      },
      decoration: InputDecoration(
          labelText: 'Confirm Password',
          hintText: 'Re-enter your password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
            child: SvgPicture.asset('assets/icons/Lock.svg'),
          )),
    );
  }
}
