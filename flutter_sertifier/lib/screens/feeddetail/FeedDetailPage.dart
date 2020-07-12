import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sertifier/screens/feeddetail/components/DetailBottom.dart';
import 'package:flutter_sertifier/screens/feeddetail/components/ShimmerEfect.dart';

import 'components/Content.dart';

class FeedDetailPage extends StatefulWidget {
  Map data;

  FeedDetailPage({Key key, @required this.data}) : super(key: key);

  @override
  _FeedDeatilPageState createState() => _FeedDeatilPageState();
}

class _FeedDeatilPageState extends State<FeedDetailPage> {
  @override
  bool showWidget = false;

  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        showWidget = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DetailBottom(),
      body: showWidget == false ? Efect() : DetailContent(content: widget.data),
    );
  }
}
