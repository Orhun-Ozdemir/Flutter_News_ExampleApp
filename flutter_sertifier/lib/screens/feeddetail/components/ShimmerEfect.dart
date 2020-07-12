import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sertifier/screens/feeddetail/components/basicbox.dart';
import 'package:shimmer/shimmer.dart';

class Efect extends StatefulWidget {
  @override
  _EfectState createState() => _EfectState();
}

class _EfectState extends State<Efect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Shimmer.fromColors(
          child: ListView(children: <Widget>[
            Column(
              children: <Widget>[
                Box().boldBox(context),

                Box().sbolddBox(context),

                Box().xlbolddBox(context),

                ///////////////////////////////////////////////////////////////////////////  1
                Container(
                  width: MediaQuery.of(context).size.width * 9 / 10,
                  height: MediaQuery.of(context).size.height * 0.275 * 6 / 10,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Box().longBox(context);
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.green,
                  height: MediaQuery.of(context).size.height * 0.275 / 10,
                  width: MediaQuery.of(context).size.width * 9 / 10,
                ),

                ///////////////////////////////////////////////////////////////////////////// KISA
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 5 / 10,
                      top: 10),
                  color: Colors.green,
                  height: MediaQuery.of(context).size.height * 0.275 / 10,
                  width: MediaQuery.of(context).size.width * 4 / 10,
                ),
              ],
            )
          ]),
          baseColor: Color.fromARGB(0xFF, 0xD8, 0xD8, 0xD9),
          highlightColor: Color.fromARGB(0xFF, 0xFB, 0xFB, 0xFB)),
    );
  }
}
