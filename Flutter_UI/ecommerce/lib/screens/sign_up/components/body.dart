import 'package:ecommerce/components/social_icon.dart';
import 'package:ecommerce/components/top_text_authen.dart';
import 'package:ecommerce/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/cupertino.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopTextAuthen(
                titleHeader: 'Register Account',
                title: 'Complete your detail or continue with social media'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SignUpForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.075,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(icon: 'assets/icons/google-icon.svg', press: () {}),
                SocialIcon(icon: 'assets/icons/facebook-2.svg', press: () {}),
                SocialIcon(icon: 'assets/icons/twitter.svg', press: () {}),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'By continuing your confirm that you agree with our Term and Condition',
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
