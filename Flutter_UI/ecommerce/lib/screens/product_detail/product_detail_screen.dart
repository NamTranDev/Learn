import 'package:ecommerce/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = "/product_detail";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: FlatButton(
                padding: EdgeInsets.zero,
                color: Colors.white,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(Icons.arrow_back_ios),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends PreferredSize {
  @override
  final Widget child;

  CustomAppBar({required this.child})
      : super(
            child: child,
            preferredSize: Size.fromHeight(AppBar().preferredSize.height));

  @override
  Widget build(BuildContext context) => child;
}

class ProductDetailArgument {
  final Product product;

  ProductDetailArgument({required this.product});
}
