import 'package:ecommerce/screens/home/components/popular_products.dart';
import 'package:ecommerce/screens/home/components/special_offer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            HomeHeader(),
            SizedBox(
              height: 30,
            ),
            DiscountBanner(),
            SizedBox(
              height: 30,
            ),
            Categories(),
            SizedBox(
              height: 30,
            ),
            SpecialOffer(),
            SizedBox(
              height: 30,
            ),
            PopularProducts(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
