import 'package:ecommerce/components/no_account_text.dart';
import 'package:ecommerce/components/social_icon.dart';
import 'package:ecommerce/components/top_text_authen.dart';
import 'package:ecommerce/screens/sign_in/components/sign_in_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopTextAuthen(
                  titleHeader: 'Welcome Back',
                  title:
                      'Sign in with your email and password or continue with social media'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SignInForm(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(
                      icon: 'assets/icons/google-icon.svg', press: () {}),
                  SocialIcon(icon: 'assets/icons/facebook-2.svg', press: () {}),
                  SocialIcon(icon: 'assets/icons/twitter.svg', press: () {}),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              NoAccountText()
            ],
          ),
        ),
      ),
    );
  }
}
