import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpperFeed extends StatefulWidget {
  Map upperFeed;

  UpperFeed(this.upperFeed);
  @override
  _UpperFeddState createState() => _UpperFeddState();
}

class _UpperFeddState extends State<UpperFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////7
            border: Border.all(
                width: 0.1, color: Colors.grey, style: BorderStyle.solid)),
        width: MediaQuery.of(context).size.width * 8 / 10,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              //   stack kullanıyorum  img in üstüne type ı koymak için
              children: <Widget>[
                //  ilk img koydum  daha sonrada positioned ı koydum üste çıkması için
                Opacity(
                  opacity: 0.50,
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 8 / 10,
                    padding: EdgeInsets.all(0),
                    color: Colors.black,
                    child: Image.network(
                      widget.upperFeed["imgUrl"],
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                ////////////////////////////////////////////////////////////////////////////////////////////////////////
                Positioned(
                    top: MediaQuery.of(context).size.width * 0.3 / 10,
                    left: MediaQuery.of(context).size.width * 6.2 / 10,
                    child: Opacity(
                        opacity: 0.50,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          color: Colors.black,
                          child: Text(
                            widget.upperFeed["type"],
                            style: TextStyle(color: Colors.white),
                          ),
                        )))
              ],
            ),

            ////////////////////////////////////////////////////////////////////////////////////////////////////////                  LİNK
            Container(
              margin: EdgeInsets.only(right: 180, top: 5),
              child: Text(
                (widget.upperFeed["link"] as String).substring(8),
                style: TextStyle(color: Colors.grey),
              ),
            ),
            /////////////////////////////////////////////////////////////////////////////////////////////////////////               TİTLE
            Container(
                margin: EdgeInsets.only(left: 9),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 9),
                height: MediaQuery.of(context).size.height * 1.75 / 10,
                width: MediaQuery.of(context).size.width * 8 / 10,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: AutoSizeText(
                              widget.upperFeed["title"],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          //////////////////////////////////////////////////////////////////////////////////// READ TİME
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${widget.upperFeed["readTimeMinutes"]} minutes",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 0),
                              margin: EdgeInsets.only(top: 8, right: 60),
                              width: 250,
                              child: AutoSizeText(
                                widget.upperFeed["text"],
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              )),
                          //////////////////////////////////////////////////////////////////////////////////////  TEXT
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            height: 25,
                            width: MediaQuery.of(context).size.width * 8 / 10,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/bookmark.svg",
                                        height: 20,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "Bookmarks",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 11),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/checkmark-done-circle.svg",
                                        height: 20,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "Mark as read",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 11),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/icons/share.svg",
                                        height: 20,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "Share",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 11),
                                      )
                                    ],
                                  )
                                ]),
                          ),
                        ],
                      ),

                      ///////////////////////////////////////////////////////////////////////////////// ICONS
                    ])),
          ],
        ));
  }
}
