import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Topbar {
  var width;

  getCustomAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Column(children: <Widget>[
        Hero(
          tag: Object(),
          child: Container(
            height: 83,
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 45, left: 180),
                        child: Text("Feed",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 10,
                        width: 50,
                        margin: EdgeInsets.only(bottom: 0, left: 180),
                        child:
                            SvgPicture.asset("assets/icons/colored_line.svg"),
                      )
                    ]),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset(
                    "assets/icons/noun_Search_3402452.svg",
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 0),
            child: Divider(
              height: 1,
              thickness: 2,
            ))
      ]),
    );
  }
}

/*Text("Feed",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ),
                
                
                
                
                
                 SvgPicture.asset(
                  "assets/icons/noun_Search_3402452.svg",
                  height: 40,
                ),*/
