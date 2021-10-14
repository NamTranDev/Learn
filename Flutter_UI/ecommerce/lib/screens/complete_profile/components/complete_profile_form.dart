import 'package:ecommerce/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  String? first_name;
  String? last_name;
  String? phone;
  String? address;
  final _formKey = GlobalKey<FormState>();
  var validateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidateMode: validateMode,
        child: Column(
          children: [
            buildFirstNameForm(),
            SizedBox(
              height: 20,
            ),
            buildLastNameForm(),
            SizedBox(
              height: 20,
            ),
            buildPhoneForm(),
            SizedBox(
              height: 20,
            ),
            buildAddressForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            DefaultButton(
                text: 'Continue',
                onClick: () {
                  if (_formKey.currentState?.validate() == true) {
                  } else {
                    setState(() {
                      validateMode = AutovalidateMode.onUserInteraction;
                    });
                  }
                })
          ],
        ));
  }

  TextFormField buildFirstNameForm() {
    return TextFormField(
      onSaved: (newValue) => first_name = newValue,
      validator: (value) {
        var input = value ?? '';
        if (input.isEmpty) {
          return kFirstNameEmptyError;
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'First Name',
          hintText: 'Enter your first name',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
            child: SvgPicture.asset('assets/icons/User Icon.svg'),
          )),
    );
  }

  TextFormField buildLastNameForm() {
    return TextFormField(
      onSaved: (newValue) => last_name = newValue,
      validator: (value) {
        var input = value ?? '';
        if (input.isEmpty) {
          return kLastNameEmptyError;
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Last Name',
          hintText: 'Enter your last name',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
            child: SvgPicture.asset('assets/icons/User Icon.svg'),
          )),
    );
  }

  TextFormField buildPhoneForm() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phone = newValue,
      validator: (value) {
        var input = value ?? '';
        if (input.isEmpty) {
          return kPhoneNameEmptyError;
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Phone',
          hintText: 'Enter your phone number',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
            child: SvgPicture.asset('assets/icons/Phone.svg'),
          )),
    );
  }

  TextFormField buildAddressForm() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      validator: (value) {
        var input = value ?? '';
        if (input.isEmpty) {
          return kAddressEmptyError;
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Address',
          hintText: 'Enter your address',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
            child: SvgPicture.asset('assets/icons/Location point.svg'),
          )),
    );
  }
}
