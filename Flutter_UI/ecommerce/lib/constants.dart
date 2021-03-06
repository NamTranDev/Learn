import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final otpDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 15),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    border: outlineInputBorder());

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: kTextColor));
}

//Form Error
final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
const String kEmailEmptyError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid email";
const String kPasswordEmptyError = "Please Enter your password";
const String kPasswordShortError = "Password is too short";
const String kPasswordMatchError = "Password don't match";
const String kFirstNameEmptyError = "Please Enter your first name";
const String kLastNameEmptyError = "Please Enter your last name";
const String kAddressEmptyError = "Please Enter your address";
const String kPhoneNameEmptyError = "Please Enter your phone";
