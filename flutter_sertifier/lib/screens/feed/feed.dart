import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sertifier/components/appbar.dart';
import 'package:flutter_sertifier/components/bottomNavigation.dart';
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_sertifier/screens/feeddetail/FeedDetailPage.dart';

import 'package:flutter_svg/flutter_svg.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<FeedPage> {
  var topbar =
      Topbar(); //  topBar  sınıfınından getcustomAppbar metodunu kullanmak için nesne üretiyorum

  Future data() async {
    var jsondata = await DefaultAssetBundle.of(context)
        .loadString("assets/json/appData.json");

    var ogrenci = json.decode(jsondata);
    debugPrint(ogrenci["upperFeed"][0]["id"].toString());
    return ogrenci;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: topbar.getCustomAppBar(),
          bottomNavigationBar: BottomNavigation(),
          body: FutureBuilder(
            future: data(),
            builder: (context, fData) {
              if (fData.connectionState == ConnectionState.done) {
                debugPrint("bekler");
                var x = fData.data;
                //debugPrint(x["upperFeed"].length.toString());

                return SingleChildScrollView(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6 / 10,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.2 / 10),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "What Are You Learning Today" +
                            "${x["user"]["name"]} ?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 4.2 / 10,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: x["upperFeed"].length,
                            itemBuilder: (context, index) {
                              debugPrint(index.toString());
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FeedDetailPage(
                                                  data: x["upperFeed"][index],
                                                )));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          ///////////////////////////////////////
                                          border: Border.all(
                                              width: 0.1,
                                              color: Colors.grey,
                                              style: BorderStyle.solid)),
                                      width: MediaQuery.of(context).size.width *
                                          8 /
                                          10,
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        children: <Widget>[
                                          Stack(
                                            children: <Widget>[
                                              Opacity(
                                                opacity: 0.50,
                                                child: Container(
                                                  height: 120,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      8 /
                                                      10,
                                                  padding: EdgeInsets.all(0),
                                                  color: Colors.black,
                                                  child: Image.network(
                                                    x["upperFeed"][index]
                                                        ["imgUrl"],
                                                    fit: BoxFit.fitWidth,
                                                    alignment:
                                                        Alignment.topCenter,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3 /
                                                      10,
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      6.2 /
                                                      10,
                                                  child: Opacity(
                                                      opacity: 0.50,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        alignment:
                                                            Alignment.center,
                                                        color: Colors.black,
                                                        child: Text(
                                                          x["upperFeed"][index]
                                                              ["type"],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )))
                                            ],
                                          ),
                                          //////////////////////////////////////////////////////////////               iMG URL

                                          ////////////////////////////////////////////////////////////                  LİNK
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: 180, top: 5),
                                            child: Text(
                                              (x["upperFeed"][index]["link"]
                                                      as String)
                                                  .substring(8),
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                          ////////////////////////////////////////////////////////////                  TİTLE
                                          Container(
                                              margin: EdgeInsets.only(left: 9),
                                              alignment: Alignment.topLeft,
                                              padding: EdgeInsets.only(left: 9),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  1.75 /
                                                  10,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  8 /
                                                  10,
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Column(
                                                      children: <Widget>[
                                                        Container(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: AutoSizeText(
                                                            x["upperFeed"]
                                                                    [index]
                                                                ["title"],
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                            maxLines: 2,
                                                          ),
                                                        ),
                                                        //////////////////////////////////////////////////////////////////////////////////// READ TİME
                                                        Container(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "${x["upperFeed"][index]["readTimeMinutes"]} minutes",
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 0),
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 8,
                                                                    right: 60),
                                                            width: 250,
                                                            child: AutoSizeText(
                                                              x["upperFeed"]
                                                                      [index]
                                                                  ["text"],
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              maxLines: 2,
                                                            )),
                                                        //////////////////////////////////////////////////////////////////////////////////////  TEXT
                                                      ],
                                                    ),
                                                    Column(
                                                      children: <Widget>[
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 15),
                                                          height: 25,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              8 /
                                                              10,
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Row(
                                                                  children: <
                                                                      Widget>[
                                                                    SvgPicture
                                                                        .asset(
                                                                      "assets/icons/bookmark.svg",
                                                                      height:
                                                                          20,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                    Text(
                                                                      "Bookmarks",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              11),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: <
                                                                      Widget>[
                                                                    SvgPicture
                                                                        .asset(
                                                                      "assets/icons/checkmark-done-circle.svg",
                                                                      height:
                                                                          20,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                    Text(
                                                                      "Mark as read",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              11),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: <
                                                                      Widget>[
                                                                    SvgPicture
                                                                        .asset(
                                                                      "assets/icons/share.svg",
                                                                      height:
                                                                          20,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                    Text(
                                                                      "Share",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              11),
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
                                      )));
                            })),
                    Container(
                        padding: EdgeInsets.only(bottom: 10, left: 15),
                        alignment: Alignment.bottomLeft,
                        height: MediaQuery.of(context).size.height * 0.750 / 10,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "MyList",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                            ])),
                    Container(
                        height: MediaQuery.of(context).size.height * 2.4 / 10,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: x["myList"].length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: x["myList"][index]));
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: BorderDirectional(
                                            top: BorderSide(width: 0.15),
                                            start: BorderSide(width: 0.15),
                                            end: BorderSide(width: 0.15),
                                            bottom: BorderSide(width: 0.15))),
                                    width: MediaQuery.of(context).size.width *
                                        3.5 /
                                        10,
                                    margin: EdgeInsets.only(left: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Opacity(
                                                opacity: 0.50,
                                                child:
                                                    Column(children: <Widget>[
                                                  Stack(children: [
                                                    Container(
                                                      child: Image.network(
                                                        x["myList"][index]
                                                            ["imgUrl"],
                                                      ),
                                                    ),
                                                    Positioned(
                                                        top: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.1 /
                                                            10,
                                                        left: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            2.13 /
                                                            10,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          color: Colors.black,
                                                          child: Text(
                                                            x["myList"][index]
                                                                ["type"],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ))
                                                  ]),
                                                  Container(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: AutoSizeText(
                                                        (x["myList"][index]
                                                                    ["link"]
                                                                as String)
                                                            .substring(8),
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color:
                                                                Colors.grey)),
                                                  ),
                                                ])),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  3.5 /
                                                  10,
                                              child: AutoSizeText(
                                                x["myList"][index]["title"],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 15, left: 15),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4 /
                                              10,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              3.5 /
                                              10,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                    )),
                              );
                            }))
                  ],
                ));
              } else {
                return Container(
                  color: Colors.green,
                  width: 50,
                  height: 50,
                );
              }
            },
          ),
        ));
  }
}
