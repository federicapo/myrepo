import 'package:flutter/material.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "NEWS APP",
          style: Theme.of(context).textTheme.headline1,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text("Search page",
                style: Theme.of(context).textTheme.headline3),
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter a search term',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                onChanged: (text) {
                  print("First text field: $text");
                },
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
