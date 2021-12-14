import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'cart_item.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCarts[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(
                    0xFFFFE6E6,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset('assets/icons/Trash.svg')
                ],
              ),
            ),
            child: CartItem(
              cart: demoCarts[index],
            ),
          ),
        ),
        itemCount: demoCarts.length,
      ),
    );
  }
}
