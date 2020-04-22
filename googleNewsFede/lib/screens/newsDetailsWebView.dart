import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailWebView extends StatefulWidget {
  final Article article;
  final color;
  NewsDetailWebView(this.article, this.color);
  @override
  createState() => _NewsDetailWebViewState(this.article, this.color);
}

class _NewsDetailWebViewState extends State<NewsDetailWebView> {
  Article _article;
  var _color;
  final _key = UniqueKey();
  _NewsDetailWebViewState(this._article, this._color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
              child: WebView(
                  key: _key,
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: _article.url))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {shareArticle(_article);},
            ),
            IconButton(
              icon: Icon(Icons.grade),
              onPressed: () {salvaPreferiti("articleList", _article);},
              color: _color,
            ),
          ],
        ),
      ),
    );
  }

  shareArticle(Article article) {
    final RenderBox box = context.findRenderObject();
    Share.share(article.url,
      subject: article.title,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  salvaPreferiti(String key, Article value) async {
    final prefs = await SharedPreferences.getInstance();
    var articleListString = new List<String>();
    articleListString = prefs.getStringList("articleList");
    
    var pref = false;
    if(!value.preferred) {
      pref = true;
    } 
    Article art = new Article(author: value.author, title: value.title, description: value.description, url: value.url, urlToImage: value.urlToImage, publishedAt: value.publishedAt, source: value.source,preferred: pref);
    if(articleListString == null) {
      articleListString = new List<String>();
    }
    var color;
    if(pref) {
      articleListString.add(json.encode(art));
      color = Colors.green[300];
    } else {
      articleListString.remove(json.encode(value));
      color = Colors.grey;
    }
      
    prefs.setStringList(key, articleListString);
    setState(() {
        _color = color;
    });
  }
}
