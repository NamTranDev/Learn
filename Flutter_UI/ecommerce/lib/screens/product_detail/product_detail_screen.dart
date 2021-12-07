import 'package:ecommerce/components/round_icon.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/product_detail/component/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = "/product_detail";
  @override
  Widget build(BuildContext context) {
    final ProductDetailArgument? argument =
        ModalRoute.of(context)?.settings.arguments as ProductDetailArgument?;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: appbar(context, argument?.product),
      body: Body(
        product: argument?.product,
      ),
    );
  }

  PreferredSize appbar(BuildContext context, Product? product) {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon center button bug => https://stackoverflow.com/questions/65949676/flutter-icon-is-not-centered-in-container
              RoundIcon(
                icon: Icons.arrow_back,
                onClick: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Row(
                  children: [
                    Text(
                      product?.rating.toString() ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset("assets/icons/Star Icon.svg")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailArgument {
  final Product product;

  ProductDetailArgument({required this.product});
}
