import 'package:ecommerce/components/icon_with_counter.dart';
import 'package:ecommerce/screens/home/components/search_field.dart';
import 'package:flutter/cupertino.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(onSearch: (value) {}),
          IconWithCounter(
            count: 0,
            icon: 'assets/icons/Cart Icon.svg',
            onClick: () {},
          ),
          IconWithCounter(
            count: 4,
            icon: 'assets/icons/Bell.svg',
            onClick: () {},
          )
        ],
      ),
    );
  }
}
