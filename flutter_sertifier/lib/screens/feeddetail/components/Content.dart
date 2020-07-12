import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DetailContent extends StatelessWidget {
  Map content;
  String letter;

  DetailContent({Key key, @required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ///////////////////////////////////////////////////////////////////////////////////////   TİTLE
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.75 / 10,
                right: MediaQuery.of(context).size.width * 3 / 10,
                left: MediaQuery.of(context).size.width * 0.50 / 10),
            child: AutoSizeText(
              content["title"],
              style: TextStyle(fontSize: 22, wordSpacing: 2),
            ),
          ),
          ///////////////////////////////////////////////////////////////////////////////////////  İMG
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.50 / 10,
              right: MediaQuery.of(context).size.width * 0.50 / 10,
              top: MediaQuery.of(context).size.width * 0.50 / 10,
            ),
            child: Image.network(content["imgUrl"]),
          ),
          /////////////////////////////////////////////////////////////////////////////////////// TEXT
          Opacity(
              opacity: 0.35,
              child: Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.10 / 10,
                  left: MediaQuery.of(context).size.width * 0.50 / 10,
                ),
                child: Text("${content["readTimeMinutes"]} minutes reading"),
              )),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.50 / 10,
              right: MediaQuery.of(context).size.width * 1.25 / 10,
            ),
            child: Text(
              content["text"],
              strutStyle: StrutStyle(
                forceStrutHeight: false,
              ),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                height: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
