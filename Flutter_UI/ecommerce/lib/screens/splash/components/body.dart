import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  SizeConfig sizeConfig = SizeConfig();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                "TOKOTO",
                style: TextStyle(
                    fontSize: sizeConfig.getProportionateScreenWidth(12)),
              )
            ],
          ),
          flex: 3,
        ),
        Expanded(
          child: SizedBox(),
          flex: 2,
        )
      ],
    );
  }
}
