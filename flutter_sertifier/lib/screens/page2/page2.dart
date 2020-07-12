import 'package:flutter/material.dart';
import 'package:flutter_sertifier/components/appbar.dart';
import 'package:flutter_sertifier/components/bottomNavigation.dart';

class Page2 extends StatelessWidget {
  var topbar = Topbar();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: topbar.getCustomAppBar(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}
