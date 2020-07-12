import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sertifier/components/appbar.dart';
import 'package:flutter_sertifier/components/bottomNavigation.dart';
import 'dart:convert';
import 'package:flutter_sertifier/screens/feed/components/myList.dart';
import 'package:flutter_sertifier/screens/feed/components/upperFeed.dart';
import 'package:flutter_sertifier/screens/feeddetail/FeedDetailPage.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

///////////////////////////////////////////////////////////////// bu sayfada sayfayı ikiye ayırıyorum ve   ListVİewwer içinde   myList ve UpperFeed  widgetlarını çağırıyorum
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
                var x = fData.data;

                return SingleChildScrollView(
                    /////////////////////////////////////////  sayafanın aşagı dogru scrollable olması için single child kullndım
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
                                  child: UpperFeed(x["upperFeed"][index]));
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

                    ////////////////////////////////////////////////////////7///////////////////////////////////////////////////////////////////////
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
                                          builder: (context) => FeedDetailPage(
                                              data: x["upperFeed"][index])));
                                },
                                child: MyList(x["myList"][
                                    index]) /////////////////////////////////////////////////////////////////////////////////////////////
                                ,
                              );
                            }))
                  ],
                ));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
