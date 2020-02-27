import 'package:flutter/material.dart';
import 'list.dart';



class barn extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _barn();
  }

}

class _barn extends State<barn>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: Scaffold(

        body:list(url: 'http://www.mocky.io/v2/5dfccffc310000efc8d2c1ad',path: 1)

        

      ),

    );
  }

}


