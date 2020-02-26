import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as Convert;
import 'package:badges/badges.dart';
import 'main.dart';

List<Map> lstFin = [];
var icons;
var defaultValue = 0;
String chkVal;
int count = 0;



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


        body: FutureBuilder(
            future: dataload(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {



                return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {

                      List chkVal = snapshot.data[index]['addonCat'];

                      if (snapshot.data[index]["dish_Type"] == 2) {
                        icons = Icon(
                          Icons.radio_button_checked,
                          color: Colors.green,
                          size: 20,
                        );
                      } else {
                        icons = Icon(
                          Icons.radio_button_checked,
                          color: Colors.red,
                          size: 20,
                        );
                      }

                      return Card(
                        child: Container(
                          height: 200,
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              icons,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    fit: FlexFit.loose,
                                    flex: 3,
                                    child: Container(
                                        width: 200,
                                        child: Text(
                                            snapshot.data[index]['dish_name'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16))),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    fit: FlexFit.tight,
                                    child: Container(
                                      width: 217,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            (snapshot.data[index]
                                                    ['dish_currency'] +
                                                " " +
                                                snapshot.data[index]
                                                        ['dish_price']
                                                    .toString()),
                                          ),
                                          Text(
                                            snapshot.data[index]
                                                        ['dish_calories']
                                                    .toString() +
                                                " " +
                                                'calories',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 6,
                                    fit: FlexFit.loose,
                                    child: Container(

                                      padding: EdgeInsets.only(top:7),

                                        width: 220,
                                        child: Text(
                                          snapshot.data[index]
                                              ['dish_description'],
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                  ),
                                  Flexible(
                                    flex: 4,
                                    fit: FlexFit.loose,
                                    child: Container(

                                      height: 35,
                                      width: 120,
                                      margin: EdgeInsets.only(
                                          top: 10),
                                      decoration: new BoxDecoration(
                                        color: Color(0xff32CD32),
                                        border: Border.all(
                                            color: Colors.black, width: 0.0),
                                        borderRadius: new BorderRadius.all(
                                            Radius.elliptical(90, 80)),
                                      ),
                                      child:

                                      counterWidget()
                                    ),
                                  ),


                                    Flexible(

                                    flex:2,
                                    fit:FlexFit.loose,

                                    child: Container(



                                       padding: EdgeInsets.only(top: 8),

                                        child: chkVal.length!=0 ?Text('Customization Available',style: TextStyle(color: Colors.red)) : Text("")

                                    ),

                                  )
                                ],
                              ),
                              Flexible(
                                flex: 2,
                                fit: FlexFit.loose,
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  child: Image.network(
                                    snapshot.data[index]['dish_image'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: lstFin.length);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}

Future<List<Map>> dataload() async {
  var url = "http://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";
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

  var k = lstFin;
  var j = k;

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



