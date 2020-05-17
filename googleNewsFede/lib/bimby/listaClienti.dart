import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import './container_bimby.dart';
import './bimbyAction.dart';
import 'appbar_bimby.dart';
import 'bimby-bloc.dart';

class ListaClienti extends StatefulWidget {
  ListaClienti({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListaClientiState createState() => _ListaClientiState();
}

class _ListaClientiState extends State<ListaClienti> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BimbyBloc>(context, listen: false);
    return new Scaffold(
      appBar: AppBarBimby(
        title: widget.title,
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        notifyParent: _refreshMenu,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.grey[300],
            child: new ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                  child: OnSlideSimple(
                    items: [
                      new ActionItemsSimple(
                          icon: new IconButton(
                            icon: new Icon(Icons.call),
                            onPressed: () {},
                            color: Colors.white,
                          ),
                          onPress: () {},
                          backgroudColor: Colors.green[500]),
                      new ActionItemsSimple(
                          icon: new IconButton(
                            icon: new Icon(Icons.email),
                            onPressed: () {},
                            color: Colors.white,
                          ),
                          onPress: () {},
                          backgroudColor: Colors.green[900])
                    ],
                    child: buildCard(),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
          AnimatedOpacity(
            opacity: bloc.getViewMenu() ? 1.0 : 0.0,
            duration: Duration(milliseconds: 100),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.5, horizontal: 20),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: InkWell(
                      child: Text(
                        "CLIENTI",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListaClienti(
                                      title: "CLIENTI",
                                    )));
                      },
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.5, horizontal: 20),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: InkWell(
                      child: Text(
                        "TORNA AL PORTALE",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      onTap: () async {
                        if (await canLaunch("https://www.bimby.it")) {
                          await launch("https://www.bimby.it");
                        }
                      },
                    ),
                  )
                ],
              ),
              color: Colors.grey[200],
            ),
          ),
        ],
      ),
    );
  }

  Widget text(String up, String down) {
    return Column(
      children: <Widget>[
        Text(
          up,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          down,
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }

  firstRow() {
    return Padding(
        padding: EdgeInsets.all(5),
        child: new Row(
          children: <Widget>[
            Text(
              "",
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Mario Rossi",
                    style: Theme.of(context).textTheme.headline1),
                Text("Via arcimabaldo 9000, 20137 Milano",
                    style: Theme.of(context).textTheme.bodyText1)
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Text(
              "",
              style: TextStyle(fontSize: 18, color: Colors.green),
            )
          ],
        ));
  }

  buildCard() {
    return new Container(
      width: 300.0,
      height: 120.0,
      child: ContainerBimby(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[200],
                      width: 1.0,
                    ),
                  ),
                ),
                child: firstRow(),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text("Ult.mod.", "TM5"),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey[200],
                    ),
                    text("Ult.acquisto", "21.12.2020"),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey[300],
                    ),
                    text("Tipo ult. cont.", "Demo")
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "",
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.white,
                      ),
                      Text(
                        "",
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.white,
                      ),
                      Text(
                        "",
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.white,
                      ),
                      Text(
                        "",
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.white,
                      ),
                      Text(
                        "",
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          false),
    );
  }

  _refreshMenu() {
    setState(() {});
  }
}
