import 'package:flutter/material.dart';
import 'list.dart';

class fastfod extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _fastfod();
  }

}

class _fastfod extends State<fastfod>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: Scaffold(

        body: Center(

          child: list(url: "http://www.mocky.io/v2/5dfccffc310000efc8d2c1ad", path: 5),

        ),

      ),

    );;
  }

}
