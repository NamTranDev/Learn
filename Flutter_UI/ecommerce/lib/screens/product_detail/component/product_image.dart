import 'package:ecommerce/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductImage extends StatefulWidget {
  final Product? product;

  const ProductImage(this.product);

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 250,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(widget.product?.images[selected] ?? ''),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                widget.product?.images.length ?? 0,
                (index) => buildSmallPreview(
                    widget.product?.images[index], selected == index, index))
          ],
        )
      ],
    );
  }

  Widget buildSmallPreview(String? image, bool isSelected, int index) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          selected = index;
        })
      },
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
                color: isSelected ? kPrimaryColor : Colors.transparent)),
        child: Image.asset(image ?? ''),
      ),
    );
  }
}
