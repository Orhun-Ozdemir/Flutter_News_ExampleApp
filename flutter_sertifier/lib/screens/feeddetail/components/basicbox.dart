import 'package:flutter/material.dart';

// Shimmer efect için kullanılan sadece boyu genişlligi ve renngi olan container widget ları dödndüren classs

class Box {
  Container longBox(BuildContext context) {
    for (int i = 0; i < 5; i++) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.green,
        height: MediaQuery.of(context).size.height * 0.275 / 10,
        width: MediaQuery.of(context).size.width * 9 / 10,
      );
    }
  }

  Container shortBox(BuildContext context) {
    Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 5 / 10, top: 10),
      color: Colors.green,
      height: MediaQuery.of(context).size.height * 0.275 / 10,
      width: MediaQuery.of(context).size.width * 4 / 10,
    );
  }
}
