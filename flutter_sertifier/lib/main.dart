import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sertifier/components/bottomNavigation.dart';
import 'package:flutter_sertifier/screens/feed/feed.dart';
import 'package:flutter_sertifier/screens/feeddetail/components/DetailBottom.dart';
import 'package:flutter_sertifier/screens/feeddetail/components/ShimmerEfect.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/appbar.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

void main() {
  var value = Topbar();
  var efecct = Efect();

  return runApp(FeedPage());
}

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  double _progress = 0;

  void startTimer() {
    new Timer.periodic(
      Duration(milliseconds: 200),
      (Timer timer) => setState(
        () {
          if (_progress == 1) {
            timer.cancel();
          } else {
            _progress += 0.0005;
          }
        },
      ),
    );
  }

  List<Color> renk = [
    Color.fromARGB(0xFF, 0x4F, 0xC4, 0xC9),
    //Color.fromARGB(0xFF, 0xFD, 0x0D, 0x1B),
    Color.fromARGB(0xFF, 0xFE, 0xAD, 0x29)
  ];

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Center(
      child: Container(
          child: GradientProgressIndicator(
        gradient: LinearGradient(colors: renk),
        value: _progress,
      )),
    );
  }
}
