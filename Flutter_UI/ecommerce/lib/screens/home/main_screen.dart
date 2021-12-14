import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/chat/chat_tab.dart';
import 'package:ecommerce/screens/favorite/favorite_tab.dart';
import 'package:ecommerce/screens/home/home_tab.dart';
import 'package:ecommerce/screens/profile/profile_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/home';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selected = 0;

  static List<Widget> _listTab = <Widget>[
    HomeTab(),
    FavoriteTab(),
    ChatTab(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _listTab[selected],
      bottomNavigationBar: buildBottomNav(),
    );
  }

  Container buildBottomNav() {
    Color inActiveIcon = Color(0xFFB6B6B6);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -5),
            blurRadius: 15,
            spreadRadius: 0,
            color: Color(0xFFDADADA),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selected,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (value) {
              setState(() {
                selected = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/icons/Shop Icon.svg",
                    color: kPrimaryColor,
                  ),
                  icon: SvgPicture.asset(
                    "assets/icons/Shop Icon.svg",
                    color: inActiveIcon,
                  ),
                  title: Container(
                    height: 0,
                  )),
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/icons/Heart Icon.svg",
                    color: kPrimaryColor,
                  ),
                  icon: SvgPicture.asset(
                    "assets/icons/Heart Icon.svg",
                    color: inActiveIcon,
                  ),
                  title: Container(
                    height: 0,
                  )),
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/icons/Chat bubble Icon.svg",
                    color: kPrimaryColor,
                  ),
                  icon: SvgPicture.asset(
                    "assets/icons/Chat bubble Icon.svg",
                    color: inActiveIcon,
                  ),
                  title: Container(
                    height: 0,
                  )),
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    color: kPrimaryColor,
                  ),
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    color: inActiveIcon,
                  ),
                  title: Container(
                    height: 0,
                  )),
            ]),
      ),
    );
  }
}
