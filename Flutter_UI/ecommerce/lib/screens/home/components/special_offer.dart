import 'package:ecommerce/screens/home/components/section_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Special for you',
          onPress: () {},
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                category: "Smart Phone",
                image: 'assets/images/Image Banner 2.png',
                numberBrands: 18,
                onPress: () {},
              ),
              SpecialOfferCard(
                category: "Fashion",
                image: 'assets/images/Image Banner 3.png',
                numberBrands: 24,
                onPress: () {},
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  final String category, image;
  final int numberBrands;
  final GestureTapCallback onPress;

  const SpecialOfferCard(
      {Key? key,
      required this.category,
      required this.image,
      required this.numberBrands,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
            width: 250,
            height: 100,
            child: ClipRRect(
              child: Stack(
                children: [
                  Image.asset(image),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color(0xFF343434).withOpacity(0.4),
                          Color(0xFF343434).withOpacity(0.15),
                        ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$numberBrands Brands",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            )),
      ),
    );
  }
}
