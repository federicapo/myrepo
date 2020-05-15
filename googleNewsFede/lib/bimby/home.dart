import 'package:flutter/material.dart';

import 'container_bimby.dart';

class BimbyHome extends StatefulWidget {
  BimbyHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BimbyHomeState createState() => _BimbyHomeState();
}

class _BimbyHomeState extends State<BimbyHome> {
  var bottomBarHeight = 40.0;
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return new Scaffold(
      appBar: new AppBar(
        title: Row(children: <Widget>[
          Container(
            width: 50,
            child: Image(
              image: AssetImage('bimby.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  fontFamily: 'Bimbi',
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              "",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Icon(Icons.menu, color: Colors.black)
        ]),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.grey[300],
        child: Column(children: <Widget>[
          ContainerBimby(
            Row(
              children: <Widget>[
                Text(
                  "Ciao ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Flexible(
                  child: Text(
                    "ilvana crollini :)".toUpperCase(),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height:10),
          Stack(children: <Widget>[
            ContainerBimby(Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Lista clienti"),
                    Text(
                      "Accedi alla lista clienti, \n"
                      "consulta i dettagli e crea la tua \n lista da lavorare.",
                      maxLines: 2,
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(""),
                SizedBox(
                  width: 20,
                ),
              ],
            )),
            Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(6),
                  color: Colors.green,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )),
          ])
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: AnimatedContainer(
            height: bottomBarHeight,
            color: Colors.green[900],
            duration: Duration(seconds: 1),
            child: GestureDetector(
              onTap: _changeHeight,
              child: Row(children: <Widget>[
                Text("bimby", style: TextStyle(color: Colors.white)),
                Expanded(
                  child: Container(),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Apri footer", style: TextStyle(color: Colors.white),),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ],
                )
              ]),
            )),
      ),
    );
  }

  void _changeHeight() {
    var height = 40.0;
    if (bottomBarHeight > 40) {
      height = 120.0;
    } else {
      height = 40.0;
    }
    setState(() {
      bottomBarHeight = height;
    });
  }
}
