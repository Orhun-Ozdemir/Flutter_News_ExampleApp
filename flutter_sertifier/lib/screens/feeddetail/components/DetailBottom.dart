import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sertifier/components/bottomNavigation.dart';
import 'package:flutter_sertifier/screens/feed/feed.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class DetailBottom extends StatefulWidget {
  DetailBottom({Key key}) : super(key: key);

  @override
  _DetailBottomState createState() => _DetailBottomState();
}

class _DetailBottomState extends State<DetailBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9 / 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: InkWell(
              onTap: () {},
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedPage(),
                        ));
                  });
                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  size: 40,
                  color: Colors.grey,
                ),
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
