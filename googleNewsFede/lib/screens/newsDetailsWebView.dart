import 'package:flutter/material.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:hive/hive.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../main.dart';

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
  Box<Article> favoriteBox;
  _NewsDetailWebViewState(this._article, this._color);

  @override
  void initState() {
    super.initState();
    favoriteBox = Hive.box(NewsBox);
  }

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
    if (favoriteBox.containsKey(widget.article.id)) {
      setState(() {
         _color = Colors.grey;
      });
      favoriteBox.delete(widget.article.id);
      return;
    }
    setState(() {
      _color = Colors.green[300];
    });
    favoriteBox.put(widget.article.id, widget.article);
  }
}
