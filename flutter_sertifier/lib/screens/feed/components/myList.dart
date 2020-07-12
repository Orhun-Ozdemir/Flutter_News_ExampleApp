import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyList extends StatefulWidget {
  Map myList;
  MyList(this.myList);
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        ////////////////////////////////////////////////////////////////////////////////////////7
        decoration: BoxDecoration(
            border: BorderDirectional(
                top: BorderSide(width: 0.15),
                start: BorderSide(width: 0.15),
                end: BorderSide(width: 0.15),
                bottom: BorderSide(width: 0.15))),
        width: MediaQuery.of(context).size.width * 3.5 / 10,
        margin: EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Opacity(
                    opacity: 0.50,
                    child: Column(children: <Widget>[
                      Stack(children: [
                        ////////////////////////////////////////////// stack kullanıyorum  img in üstüne type ı koymak için
                        Container(
                          ///////////////////////////////////////// ilk img koydum  daha sonrada positioned ı koydum üste çıkması için
                          child: Image.network(
                            widget.myList["imgUrl"],
                          ),
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.1 / 10,
                            left: MediaQuery.of(context).size.width * 2.13 / 10,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.black,
                              child: Text(
                                widget.myList["type"],
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                      ]),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: AutoSizeText(
                            (widget.myList["link"] as String).substring(8),
                            maxLines: 1,
                            style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ),
                    ])),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: MediaQuery.of(context).size.width * 3.5 / 10,
                  child: AutoSizeText(
                    widget.myList["title"],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15, left: 15),
              height: MediaQuery.of(context).size.height * 0.4 / 10,
              width: MediaQuery.of(context).size.width * 3.5 / 10,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/bookmark.svg",
                          height: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/checkmark-done-circle.svg",
                          height: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/share.svg",
                          height: 20,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ]),
            ),
          ],
        ));
  }
}
