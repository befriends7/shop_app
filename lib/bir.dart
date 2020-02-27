import 'package:flutter/material.dart';
import 'list.dart';

class bir extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _bir();
  }

}

class _bir extends State<bir>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: Scaffold(

        body: Center(

          child: list(url: "http://www.mocky.io/v2/5dfccffc310000efc8d2c1ad", path: 4),

        ),

      ),

    );;
  }

}
