import 'package:flutter/material.dart';
import 'package:googleNewsFede/components/news_item.dart';
import 'package:googleNewsFede/services/api.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List articles = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Example');

  _SearchState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          articles = new List();
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  Widget _buildList() {
    if (_searchText.isNotEmpty) {
      _getArticles(_searchText);
    }
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, position) => NewsItem(articles[position]));
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        articles = new List();
        _filter.clear();
      }
    });
  }

  void _getArticles(String query) async {
    List tempList = new List();
    tempList = await Api().fetchArticle(query: query);

    setState(() {
      articles = tempList;
    });
  }
}
