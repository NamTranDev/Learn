import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce/storage/preference.dart';
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
              height: 20,
            ),
            buildRePasswordForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            DefaultButton(
                text: 'Continue',
                onClick: () {
                  if (_formKey.currentState?.validate() == true) {
                    Preference.instance.storeLogin(true);
                    Navigator.pushNamed(
                        context, CompleteProfileScreen.routeName);
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
      keyboardType: TextInputType.emailAddress,
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
      textInputAction: TextInputAction.next,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        password = value;
      },
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

  TextFormField buildRePasswordForm() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      validator: (value) {
        var input = value ?? '';
        if (input != password) {
          return kPasswordMatchError;
        }
        return null;
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
