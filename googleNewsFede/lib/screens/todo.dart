import 'package:flutter/material.dart';
 
class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          header(),
          Row(
            children: <Widget>[Text("Oggi"), Text("Domani")],
          ),
          listaTodo()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 20),
                    IconButton(icon: Icon(Icons.menu, size: 30), onPressed: () {  },),
                  ]))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    ));
  }
 
  header() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
          )
        ],
      ),
    );
  }
 
  listaTodo() {
    return Container();
  }
}