import 'package:ecommerce/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product?.title ?? '',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                  color: product?.isFav == true
                      ? Color(0xFFFFE6E6)
                      : Color(0xFFF5F6F9),
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(40))),
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
              child: SvgPicture.asset(
                'assets/icons/Heart Icon_2.svg',
                color: product?.isFav == true
                    ? Color(0xFFFF4848)
                    : Color(0xFFDBDEE4),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 80),
            child: Text(
              product?.description ?? '',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => {},
            child: Row(
              children: [
                Text(
                  'See More Detail',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: kPrimaryColor,
                  size: 12,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
