import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1 / 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.keyboard_arrow_left,
                size: 40,
                color: Colors.grey,
              ),
            ),
          ),
          Container(

              //color: Colors.blue,
              width: MediaQuery.of(context).size.width * 5 / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      child: Opacity(
                    opacity: 0.10,
                    child: SvgPicture.asset(
                      "assets/icons/share.svg",
                      height: 30,
                    ),
                  )),
                  Opacity(
                    opacity: 0.10,
                    child: SvgPicture.asset(
                      "assets/icons/checkmark-done-circle.svg",
                      height: 30,
                    ),
                  ),
                  Opacity(
                    opacity: 0.10,
                    child: SvgPicture.asset(
                      "assets/icons/bookmark.svg",
                      height: 30,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/icons/more.svg",
                    height: 20,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
