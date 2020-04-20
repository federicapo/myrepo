
import 'package:flutter/material.dart';
import 'package:googleNewsFede/components/news_item.dart';
import 'package:googleNewsFede/models/articlesHolder.dart';
import 'package:provider/provider.dart';

class Preferred extends StatefulWidget {
  @override
  _PreferredState createState() => _PreferredState();
}

class _PreferredState extends State<Preferred> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: Container(
          child: Consumer<ArticleHolder>(
            builder: (context, news, child) {
              return ListView.builder(
                  itemCount: news.savedArticles.length,
                  itemBuilder: (context, position) =>
                      NewsItem(news.savedArticles[position]));
            },
          ),
        ),
      ),
    );
  }
}