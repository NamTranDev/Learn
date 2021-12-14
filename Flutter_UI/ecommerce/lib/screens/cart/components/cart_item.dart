import 'package:ecommerce/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(demoCarts[0].product.images[0]),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              demoCarts[0].product.title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                  text: '\$${cart.product.price}',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                  children: [
                    TextSpan(
                        text: ' x${cart.numOfItem}',
                        style: TextStyle(color: kTextColor))
                  ]),
            )
          ],
        )
      ],
    );
  }
}
