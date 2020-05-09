import 'package:flutter/material.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../article_bloc.dart';
import '../main.dart';

class NewsDetailWebView extends StatefulWidget {
  @override
  createState() => _NewsDetailWebViewState();
}

class _NewsDetailWebViewState extends State<NewsDetailWebView> {
  final _key = UniqueKey();
  Color color;
  Box<Article> favoriteBox;
  Article article;

  @override
  initState() {
    super.initState();
    favoriteBox = Hive.box(NewsBox);
    final bloc = Provider.of<ArticleBloc>(context, listen: false);
    article = bloc.getActualArticle();
    colorDecide(article);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ArticleBloc>(context, listen: false);
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
                  initialUrl: article.url))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              shareArticle(article);
            },
          ),
          IconButton(
            icon: Icon(Icons.grade),
            onPressed: () {
              bloc.salvaPreferiti(article);
              colorDecide(article);
            },
            color: color,
          ),
        ],
      )),
    );
  }

  shareArticle(Article article) {
    final RenderBox box = context.findRenderObject();
    Share.share(article.url,
        subject: article.title,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  colorDecide(article) {
    var myColor;
    if (favoriteBox.containsKey(article.id)) {
      myColor = Colors.green[300];
    } else {
      myColor = Colors.grey;
    }
    setState(() {
      color = myColor;
    });
  }
}
