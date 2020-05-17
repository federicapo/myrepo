import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'container_bimby.dart';

class BimbyHome extends StatefulWidget {
  BimbyHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BimbyHomeState createState() => _BimbyHomeState();
}

class _BimbyHomeState extends State<BimbyHome> {
  double bottomBarHeight = 40;
  bool isOpenProfile = false;

  @override
  Widget build(BuildContext context) {
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
            child: GestureDetector(
              onTap: () => _showProfile(context),
              child: Text(
                "",
                style: TextStyle(color: isOpenProfile? Colors.green : Colors.black),
              ),
            ),
          ),
          GestureDetector(
            child: Icon(Icons.menu, color: Colors.black),
            onTap: () {},
          )
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
                  style: Theme.of(context).textTheme.headline1,
                ),
                Flexible(
                  child: Text(
                    "ilvana crollini :)".toUpperCase(),
                    style: Theme.of(context).textTheme.headline2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Stack(children: <Widget>[
            ContainerBimby(Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Lista clienti",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      "Accedi alla lista clienti, consulta i \n"
                      "dettagli e crea la tua lista da lavorare.",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "",
                  style: TextStyle(color: Colors.green, fontSize: 32),
                ),
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
            color: Theme.of(context).accentColor,
            duration: Duration(milliseconds: 500),
            child: GestureDetector(onTap: _changeHeight, child: _dynamicRow())),
      ),
    );
  }

  void _changeHeight() {
    var height = 40.0;
    if (bottomBarHeight == 40) {
      height = 120.0;
    } else {
      height = 40.0;
    }
    setState(() {
      bottomBarHeight = height;
    });
  }

  Widget _dynamicRow() {
    if (bottomBarHeight == 40) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(children: <Widget>[
          Text(
            "Vorwerk Bimby ®",
            style: Theme.of(context).textTheme.headline5,
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Apri footer",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ],
          ),
        ]),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Text(
                "Vorwerk Bimby ®",
                style: Theme.of(context).textTheme.headline5,
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Chiudi footer",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                  ),
                ],
              ),
            ]),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                InkWell(
                  child: Text(
                    "Termini e condizioni",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: () async {
                    if (await canLaunch(
                        "https://bimby.vorwerk.it/informazioni-legali/")) {
                      await launch(
                          "https://bimby.vorwerk.it/informazioni-legali/");
                    }
                  },
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  "Social Media:",
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                InkWell(
                  child: Text(
                    "Bimby.it",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: () async {
                    if (await canLaunch("http://www.bimby.it")) {
                      await launch("http://www.bimby.it");
                    }
                  },
                ),
                Expanded(
                  child: Container(),
                ),
                InkWell(
                  child: Text(
                    "",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onTap: () async {
                    if (await canLaunch(
                        "https://www.facebook.com/BimbyItalia")) {
                      await launch("https://www.facebook.com/BimbyItalia");
                    }
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: Text(
                    "",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onTap: () async {
                    if (await canLaunch("https://twitter.com/BimbyItalia")) {
                      await launch("https://twitter.com/BimbyItalia");
                    }
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: Text(
                    "",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onTap: () async {
                    if (await canLaunch(
                        "https://www.youtube.com/c/BimbyItaliaUfficiale")) {
                      await launch(
                          "https://www.youtube.com/c/BimbyItaliaUfficiale");
                    }
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: Text(
                    "",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onTap: () async {
                    if (await canLaunch(
                        "https://www.instagram.com/bimbyitalia/")) {
                      await launch("https://www.instagram.com/bimbyitalia/");
                    }
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: Text(
                    "",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onTap: () async {
                    if (await canLaunch("https://www.ricettario-bimby.it/")) {
                      await launch("https://www.ricettario-bimby.it/");
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                InkWell(
                  child: Text(
                    "Cookidoo®",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: () async {
                    if (await canLaunch("https://www.cookidoo.it/")) {
                      await launch("https://www.cookidoo.it/");
                    }
                  },
                ),
              ],
            )
          ],
        ),
      );
    }
  }

  void _showProfile(BuildContext context) {
    setState(() {
      isOpenProfile = true;
    });
    Dialog simpleDialog = Dialog(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(12.0),
      // ),
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[200],
                    width: 1.0,
                  ),
                ),
              ),
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'PROFILO',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isOpenProfile = false;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[200],
                    width: 1.0,
                  ),
                ),
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Area", style: Theme.of(context).textTheme.bodyText1),
                Text("040 - Anachilde Gentile", style: Theme.of(context).textTheme.bodyText2,)
              ],)
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[200],
                    width: 1.0,
                  ),
                ),
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Divisione", style: Theme.of(context).textTheme.bodyText1),
                Text("049 - Anachilde Gentile", style: Theme.of(context).textTheme.bodyText2,)
              ],)
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[200],
                    width: 1.0,
                  ),
                ),
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Team", style: Theme.of(context).textTheme.bodyText1),
                Text("050 - Anachilde Gentile", style: Theme.of(context).textTheme.bodyText2,)
              ],)
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[200],
                    width: 1.0,
                  ),
                ),
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Incaricata", style: Theme.of(context).textTheme.bodyText1),
                Text("Ilvana Crollini", style: Theme.of(context).textTheme.bodyText2,)
              ],)
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Codice", style: Theme.of(context).textTheme.bodyText1),
                Text("19073", style: Theme.of(context).textTheme.bodyText2,)
              ],)
            ),
          ],
        ),
      ),
    );
    showDialog(
        barrierDismissible: false,
        context: context, builder: (BuildContext context) => simpleDialog);
  }
}
