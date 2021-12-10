import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/screens/cart/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: buildCheckoutCart(),
    );
  }

  Container buildCheckoutCart() {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset('assets/icons/receipt.svg'),
                ),
                Spacer(),
                Text(
                  'Add voucher code',
                  style: TextStyle(color: kTextColor),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(text: 'Total:\n', children: [
                    TextSpan(
                        text: '\$337.15',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ))
                  ]),
                ),
                SizedBox(
                  width: 200,
                  child: DefaultButton(text: 'Check Out', onClick: () {}),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            'Your Cart',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '${demoCarts.length} items',
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
