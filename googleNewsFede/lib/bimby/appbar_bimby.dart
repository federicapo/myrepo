import 'package:flutter/material.dart';
import 'package:googleNewsFede/bimby/home.dart';
import 'package:googleNewsFede/bimby/listaClienti.dart';
import 'package:provider/provider.dart';

import 'bimby-bloc.dart';

class AppBarBimby extends StatefulWidget implements PreferredSizeWidget {
  AppBarBimby(
      {Key key, this.tabController, this.title, this.appBar, this.notifyParent})
      : super(key: key);
  final TabController tabController;
  final String title;
  final AppBar appBar;
  final Function() notifyParent;
  @override
  AppBarBimbyState createState() => AppBarBimbyState();

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

class AppBarBimbyState extends State<AppBarBimby> {
  bool _isOpenProfile = false;
  bool _visibleMenu = false;
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BimbyBloc>(context, listen: false);
    return new AppBar(
      automaticallyImplyLeading: widget.appBar.automaticallyImplyLeading,
      title: createTitle(bloc),
      bottom: widget.appBar.bottom,
      backgroundColor: Colors.white,
    );
  }

  Widget createTitle(bloc) {
    if (widget.title != "SCHEDA CLIENTE") {
      return Row(children: <Widget>[
        Container(
          width: 50,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BimbyHome(
                            title: "HOME",
                          )));
            },
            child: Image(
              image: AssetImage('bimby.png'),
              fit: BoxFit.fitHeight,
            ),
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
              style: TextStyle(
                  color: _isOpenProfile ? Colors.green : Colors.black),
            ),
          ),
        ),
        GestureDetector(
          child: Icon(Icons.menu, color: Colors.black),
          onTap: () {
            setState(() {
              _visibleMenu = !_visibleMenu;
              bloc.setViewMenu(_visibleMenu);
              widget.notifyParent();
            });
          },
        )
      ]);
    } else {
      return Row(children: <Widget>[
        Container(
          width: 50,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListaClienti(
                            title: "CLIENTI",
                          )));
            },
            child: Text("", style: Theme.of(context).textTheme.headline1),
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
        Padding(padding: EdgeInsets.all(20),)
      ]);
    }
  }

  void _showProfile(BuildContext context) {
    setState(() {
      _isOpenProfile = true;
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
                          _isOpenProfile = false;
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
                    Text("Area", style: Theme.of(context).textTheme.headline3),
                    Text(
                      "040 - Anachilde Gentile",
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                )),
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
                    Text("Divisione",
                        style: Theme.of(context).textTheme.headline3),
                    Text(
                      "049 - Anachilde Gentile",
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                )),
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
                    Text("Team", style: Theme.of(context).textTheme.headline3),
                    Text(
                      "050 - Anachilde Gentile",
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                )),
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
                    Text("Incaricata",
                        style: Theme.of(context).textTheme.headline3),
                    Text(
                      "Ilvana Crollini",
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Codice",
                        style: Theme.of(context).textTheme.headline3),
                    Text(
                      "19073",
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => simpleDialog);
  }
}
