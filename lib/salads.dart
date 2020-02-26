import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as Convert;


List<Map> lstFin = [];
var icons;

class salads extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _salads();
  }

}

class _salads extends State<salads>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: Scaffold(

        body:FutureBuilder(

            future: dataload(),

    builder: (context,snapshot)
    {

      if(snapshot.data!=null)
        {

          return  ListView.builder(

              itemBuilder: (BuildContext context,int index){

                if (snapshot.data[index]["dish_Type"] == 2)
                  {
                     icons = Icon(Icons.radio_button_checked,color: Colors.green,size: 20,);
                  }

                else
                {
                   icons = Icon(Icons.radio_button_checked,color: Colors.red,size: 20,);
                }

                return Card
                  (

                    child: Container(

                      height: 190,
                      padding: EdgeInsets.only(top:10),

                      child: Row(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[

                          SizedBox(
                        width: 10,
                      ),

                          icons,

                          SizedBox(

                            width: 4,
                          ),

                          Column(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: <Widget>[



                              Flexible(

                                fit:FlexFit.loose,
                                flex:3,

                                child: Container(

                                  width:200,

                                    child: Text(snapshot.data[index]['dish_name'],style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16))),
                              ),


                              Flexible(

                                 flex: 2,
                                 fit: FlexFit.tight,

                                  child: Text((snapshot.data[index]['dish_currency']+" "+snapshot.data[index]['dish_price'].toString()))),


                              Flexible(

                                flex: 7,
                                fit: FlexFit.loose,

                                child: Container(

                                  width: 220,



                                      child: Text(snapshot.data[index]['dish_description'],style:TextStyle(color: Colors.grey),)),
                              ),



                            ],

                          )





                        ],

                      ),
                    ),


                );



              },

              itemCount: lstFin.length);

        }return Center(child: CircularProgressIndicator(),);


    }


      ),
      ),
    );
  }

}


Future<List<Map>> dataload() async
{

  var url = "http://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";
  var chkUrl = await http.get(url);

  lstFin.clear();

  if(chkUrl.statusCode == 200)
    {


      var jsonResp = Convert.jsonDecode(chkUrl.body);
      var resp = jsonResp[0]["table_menu_list"];
      var finResp = resp[0]["category_dishes"];


      for(var finResp in finResp)
        {

          lstFin.add(finResp);

        }

    }


  return lstFin;

}