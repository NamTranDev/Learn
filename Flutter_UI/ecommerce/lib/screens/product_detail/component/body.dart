import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/top_round_corner.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/product_detail/component/product_description.dart';
import 'package:ecommerce/screens/product_detail/component/product_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_dots.dart';

class Body extends StatelessWidget {
  final Product? product;

  const Body({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImage(product),
          TopRoundCorner(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(product: product),
                TopRoundCorner(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(product: product),
                      TopRoundCorner(
                          color: Colors.white,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  DefaultButton(
                                      text: 'Add to Cart', onClick: () {}),
                                  SizedBox(
                                    height: 30,
                                  )
                                ],
                              )))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
