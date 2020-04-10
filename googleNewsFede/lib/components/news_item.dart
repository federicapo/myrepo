import 'package:flutter/material.dart';
import 'package:googleNewsFede/models/article.dart';

class NewsItem extends StatelessWidget {
  final Article article;
  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(children: <Widget>[
        Card(child: Image.network(article.urlToImage)),
        Text(article.author),
        Text(article.description)
      ]),
    );
  }
  // @override
  // _NewsItem createState() => _NewsItemState();
}
