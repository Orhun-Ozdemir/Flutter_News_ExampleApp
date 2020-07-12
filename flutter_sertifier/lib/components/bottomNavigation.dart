import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sertifier/screens/feed/feed.dart';
import 'package:flutter_sertifier/screens/page2/page2.dart';
import 'package:flutter_sertifier/screens/page3/page3.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  static int currentIndex = 0;
  @override
  Color activeColor = Color.fromARGB(0xFF, 0x4F, 0xC4, 0xC9);
  Color passiveColor = Colors.grey;

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 50.0,
      type: BottomNavigationBarType.fixed,
      iconSize: 100,
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        /// //////////////////////////////////////////////////////////////////////////   BOTTOM NAVİGATİON BAR İTEM 1     NAVİGATE  FEED
        BottomNavigationBarItem(
            title: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Text(
                "Feed",
                style: TextStyle(
                    color: currentIndex == 0 ? activeColor : passiveColor),
              ),
            ),
            icon: InkWell(
                child: SvgPicture.asset(
              "assets/icons/Star.svg",
              color: currentIndex == 0
                  ? activeColor
                  : passiveColor, /////////////////////////iconun rengini currentIndex ile beraber pasif ve aktif olrak
              height:
                  30, /////////////////////////  iki renk atadım yer değiştirmelerine göte iconun rengi değişiyor.
            ))),

        //////////////////////////////////////////////////////////////////////////  BOTTOM NAVİGATİON BAR İTEM 2   NAVİGATE PAGE 2
        BottomNavigationBarItem(
            title: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Text(
                "Label",
                style: TextStyle(
                    color: currentIndex == 1 ? activeColor : passiveColor),
              ),
            ),
            icon: InkWell(
                child: SvgPicture.asset(
              "assets/icons/Star.svg",
              color: currentIndex == 1 ? activeColor : passiveColor,
              height: 30,
            ))),

        //////////////////////////////////////////////////////////////////////////////  BOTTOM NAVİGATİON BAR İTEM 3   NAVİGATE PAGE 3
        BottomNavigationBarItem(
            title: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Text(
                "Label",
                style: TextStyle(
                    color: currentIndex == 2 ? activeColor : passiveColor),
              ),
            ),
            icon: InkWell(
                child: SvgPicture.asset(
              "assets/icons/Star.svg",
              color: currentIndex == 2 ? activeColor : passiveColor,
              height: 30,
            ))),
      ],
      onTap: (index) {
        //////////////////////////////////////////////////////////////////////////////  NAVİGASYONUN YAPILDIGI VE İNDEX İN  DEGİŞTİGİ ALAN
        setState(() {
          currentIndex = index;
          if (currentIndex == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FeedPage()));
          } else if (currentIndex == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Page2()));
          } else if (currentIndex == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Page3()));
          }
        });
      },
    );
  }
}
