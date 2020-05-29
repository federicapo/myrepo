import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import './container_bimby.dart';
import 'appbar_bimby.dart';
import 'bimby-bloc.dart';

class DettaglioClienti extends StatefulWidget {
  DettaglioClienti({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DettaglioClientiState createState() => _DettaglioClientiState();
}

class _DettaglioClientiState extends State<DettaglioClienti>
    with SingleTickerProviderStateMixin {
  final List<Tab> clientiTab = <Tab>[
    new Tab(text: "ANAGRAFICA"),
    new Tab(text: "ORDINI E ATTIVITA'")
  ];
  TabController _tabController1;
  bool ordiniAttivita = false;
  @override
  void initState() {
    super.initState();
    _tabController1 = TabController(vsync: this, length: clientiTab.length);
    _tabController1.addListener(_handleTabSelection);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BimbyBloc>(context, listen: false);
    return new Scaffold(
      appBar: AppBarBimby(
        tabController: _tabController1,
        title: widget.title,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: clientiTab,
            isScrollable: false,
            controller: _tabController1,
            indicatorColor: Colors.green,
            indicatorWeight: 3,
            labelStyle: Theme.of(context).textTheme.headline4,
            labelColor: Colors.black,
          ),
        ),
        notifyParent: _refreshMenu,
      ),
      body: bodyCreate(bloc),
    );
  }

  Widget bodyCreate(bloc) {
    if (!ordiniAttivita) {
      return Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[300],
            child: Column(children: <Widget>[
              ContainerBimby(
                  Column(
                    children: <Widget>[
                      Row(
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
                            ],
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            "",
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              color: Colors.grey[100],
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  true),
              SizedBox(height: 10),
              ContainerBimby(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Indirizzo",
                              style: Theme.of(context).textTheme.headline4),
                          Expanded(
                            child: Container(),
                          ),
                          Text("",
                              style: Theme.of(context).textTheme.headline4),
                          Text(
                            "",
                            style: Theme.of(context).textTheme.headline4,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      myData("Indirizzo", "Via Pompeo Mariani"),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          myData("Cap", "20851"),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            height: 20,
                            width: 2,
                            color: Colors.grey[300],
                          ),
                          myData("Comune", "LISSONE"),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            height: 20,
                            width: 2,
                            color: Colors.grey[300],
                          ),
                          myData("Provincia", "MB")
                        ],
                      ),
                      Divider(color: Colors.grey[300]),
                      Row(
                        children: <Widget>[
                          Text("Contatti",
                              style: Theme.of(context).textTheme.headline4),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      myData("Telefono", "039090909"),
                      SizedBox(
                        height: 5,
                      ),
                      myData("Indirizzo email", "prova.prova@mail.ir"),
                      Divider(color: Colors.grey[300]),
                      Row(
                        children: <Widget>[
                          Text("Dati Fiscali",
                              style: Theme.of(context).textTheme.headline4),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          myData("Codice Fiscale", "PZZFRC89D44F704P"),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            height: 20,
                            width: 2,
                            color: Colors.grey[300],
                          ),
                          myData("Partita iva", "123456789"),
                        ],
                      ),
                      Divider(color: Colors.grey[300]),
                      Row(
                        children: <Widget>[
                          Text("Altri Dati",
                              style: Theme.of(context).textTheme.headline4),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      myData("Consenso privacy", ""),
                      Divider(color: Colors.grey[300]),
                      Row(
                        children: <Widget>[
                          Text("Note",
                              style: Theme.of(context).textTheme.headline4),
                          Expanded(
                            child: Container(),
                          ),
                          Text("",
                              style: Theme.of(context).textTheme.headline4),
                        ],
                      ),
                    ],
                  ),
                  true)
            ]),
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
                                builder: (context) => DettaglioClienti(
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
      );
    } else {
      return Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                color: Colors.grey[300],
                child: Column(
                  children: <Widget>[
                    ContainerBimby(
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 18),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Mario Rossi",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1),
                                  ],
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    color: Colors.grey[100],
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 20,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 20,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 20,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 20,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        true),
                    SizedBox(height: 10),
                    ContainerBimby(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Ordini",
                                    style:
                                        Theme.of(context).textTheme.headline4),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            myData("Data ultimo acquisto", "29.05.2020"),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                myData("TM21", "1"),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  height: 20,
                                  width: 2,
                                  color: Colors.grey[300],
                                ),
                                myData("TM31", "0"),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  height: 20,
                                  width: 2,
                                  color: Colors.grey[300],
                                ),
                                myData("TM5 bs", "10"),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  height: 20,
                                  width: 2,
                                  color: Colors.grey[300],
                                ),
                                myData("TM5 ck", "1"),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  height: 20,
                                  width: 2,
                                  color: Colors.grey[300],
                                ),
                                myData("TM6", "1"),
                              ],
                            ),
                          ],
                        ),
                        true),
                    SizedBox(
                      height: 10,
                    ),
                    ContainerBimby(
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Attività",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  myData("Ultimo contatto", "Nessuno"),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    height: 20,
                                    width: 2,
                                    color: Colors.grey[300],
                                  ),
                                  myData("Ultimo evento", "Demo")
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: 7, left: 10),
                                      height: 30,
                                      color: Colors.grey[700],
                                      child: Text(
                                        "Attività",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    padding: EdgeInsets.only(top: 7, left: 10),
                                    height: 30,
                                    color: Colors.grey[800],
                                    child: Text(
                                      "Tot",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: 7, left: 10),
                                      height: 30,
                                      color: Colors.white,
                                      child: Text(
                                        "Dimostrazioni",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 2,
                                    color: Colors.grey[300],
                                  ),
                                  Container(
                                    width: 50,
                                    padding: EdgeInsets.only(top: 7, left: 10),
                                    height: 30,
                                    color: Colors.white,
                                    child: Text(
                                      "0",
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: 7, left: 10),
                                      height: 30,
                                      color: Colors.white,
                                      child: Text(
                                        "Dimostrazioni",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 2,
                                    color: Colors.grey[300],
                                  ),
                                  Container(
                                    width: 50,
                                    padding: EdgeInsets.only(top: 7, left: 10),
                                    height: 30,
                                    color: Colors.white,
                                    child: Text(
                                      "0",
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: 7, left: 10),
                                      height: 30,
                                      color: Colors.white,
                                      child: Text(
                                        "Dimostrazioni",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 2,
                                    color: Colors.grey[300],
                                  ),
                                  Container(
                                    width: 50,
                                    padding: EdgeInsets.only(top: 7, left: 10),
                                    height: 30,
                                    color: Colors.white,
                                    child: Text(
                                      "0",
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: 7, left: 10),
                                      height: 30,
                                      color: Colors.white,
                                      child: Text(
                                        "Dimostrazioni",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 2,
                                    color: Colors.grey[300],
                                  ),
                                  Container(
                                    width: 50,
                                    padding: EdgeInsets.only(top: 7, left: 10),
                                    height: 30,
                                    color: Colors.white,
                                    child: Text(
                                      "0",
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: 7, left: 10),
                                      height: 30,
                                      color: Colors.white,
                                      child: Text(
                                        "Dimostrazioni",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 2,
                                    color: Colors.grey[300],
                                  ),
                                  Container(
                                    width: 50,
                                    padding: EdgeInsets.only(top: 7, left: 10),
                                    height: 30,
                                    color: Colors.white,
                                    child: Text(
                                      "0",
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: 7, left: 10),
                                      height: 30,
                                      color: Colors.white,
                                      child: Text(
                                        "Dimostrazioni",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 2,
                                    color: Colors.grey[300],
                                  ),
                                  Container(
                                    width: 50,
                                    padding: EdgeInsets.only(top: 7, left: 10),
                                    height: 30,
                                    color: Colors.white,
                                    child: Text(
                                      "0",
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                        true),
                  ],
                ),
              ),
            ],
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
                                builder: (context) => DettaglioClienti(
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
      );
    }
  }

  _refreshMenu() {
    setState(() {});
  }

  myData(title, data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          data,
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }

  Future<void> _handleTabSelection() async {
    if (!_tabController1.indexIsChanging) {
      setState(() {
        ordiniAttivita = !ordiniAttivita;
      });
    } else
      print("Tab is switching..from active to inactive");
  }
}
