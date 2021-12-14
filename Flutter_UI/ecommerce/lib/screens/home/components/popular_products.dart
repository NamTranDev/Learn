import 'package:ecommerce/components/product_cart.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/home/components/section_title.dart';
import 'package:flutter/cupertino.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Populart Product',
          onPress: () {},
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            ...List.generate(
              demoProducts.length,
              (index) => ProductCard(
                product: demoProducts[index],
              ),
            ),
            SizedBox(
              width: 20,
            )
          ]),
        ),
      ],
    );
  }
}
