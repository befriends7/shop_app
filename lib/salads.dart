import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as Convert;
import 'package:badges/badges.dart';
import 'list.dart';

List<Map> lstFin = [];
var icons;
var defaultValue = 0;
String chkVal;
int count = 0;
var url = "http://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";


class salads extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _salads();
  }
}

class _salads extends State<salads> {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(


        body: list(url: "http://www.mocky.io/v2/5dfccffc310000efc8d2c1ad", path: 0)
      ),
    );
  }
}

Future<List<Map>> dataload(String url) async {

  var chkUrl = await http.get(url);

  lstFin.clear();

  if (chkUrl.statusCode == 200) {
    var jsonResp = Convert.jsonDecode(chkUrl.body);
    var resp = jsonResp[0]["table_menu_list"];
    var finResp = resp[0]["category_dishes"];

    for (var finResp in finResp) {
      lstFin.add(finResp);
    }
  }


  return lstFin;
}

class counterWidget extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _counterWidget();
  }

}


class _counterWidget extends State<counterWidget>
{




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[


        IconButton(


          onPressed: ()

          {

            setState(() {

              if(defaultValue!=0) {
                defaultValue --;
              }


            });

          },

          icon: Icon(Icons.remove,color: Colors.white,),

        ),

        Text(defaultValue.toString(),style: TextStyle(color: Colors.white)),

        IconButton(

          onPressed: ()
          {
            setState(() {


                defaultValue ++;


            });
          },

          icon: Icon(Icons.add,color: Colors.white,),

        )

      ],

    );
  }

}



