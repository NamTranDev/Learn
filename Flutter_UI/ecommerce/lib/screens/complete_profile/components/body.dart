import 'package:ecommerce/components/top_text_authen.dart';
import 'package:flutter/cupertino.dart';

import 'complete_profile_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TopTextAuthen(
                titleHeader: 'Complete Profile',
                title: 'Complete your detail profile'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            CompleteProfileForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
