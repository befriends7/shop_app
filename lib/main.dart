import 'package:flutter/material.dart';
import 'package:shop_app/salads.dart';
import 'package:shop_app/barn.dart';
import 'package:shop_app/henhouse.dart';
import 'package:shop_app/fresh.dart';
import 'package:shop_app/bir.dart';
import 'package:shop_app/fastfod.dart';
import 'package:badges/badges.dart';

void main() => runApp(MyApp());

int cartBadg = 0;


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return dataloads();
  }
}

class dataloads extends StatefulWidget {




  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _dataloads();
  }
}

class _dataloads extends State<dataloads>
{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.pink),
        home: DefaultTabController(
            length: 6,
            child: Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.grey,
                      onPressed: () {
                        print("back button");
                      }),
                  title: Text('UNI Resto Cafe',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold,fontSize: 17)),
                  actions: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(0.0, 19.0, 18.0, 0.0),
                        child: Text("My Orders",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                                fontWeight: FontWeight.bold))),
                    Container(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0.0, 19.0, 10.0, 0.0),
                          child: cartNot(),
                        ))
                  ],
                  bottom: TabBar(
                      labelColor: Colors.pink,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      tabs: [
                        Tab(
                          text: "Salads and Soup",
                        ),
                        Tab(
                          text: 'From the Barnyard',
                        ),
                        Tab(text: ' From the Hen House'),
                        Tab(text: 'Fresh From Sea'),
                        Tab(text: 'Biriyani'),
                        Tab(text: 'Fast Food'),
                      ])),
              body: TabBarView(
                children: <Widget>[
                  salads(),
                  barn(),
                  henhouse(),
                  fresh(),
                  bir(),
                  fastfod()
                ],
              ),
            )));
  }
}






class cartNot extends StatefulWidget
{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _carNot();
  }

}

class _carNot extends State<cartNot>
{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Badge(



        badgeContent: Text(cartBadg.toString()),
        child: Icon(
          Icons.shopping_cart,
          color: Colors.grey,
        ));
    
  }

}




