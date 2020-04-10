import 'package:flutter/material.dart';
import 'package:googleNewsFede/components/news_item.dart';
import 'package:googleNewsFede/models/articlesHolder.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEWS APP")
      ),
      body:Container(
        child: new Center(
          child: Container(
            child: Consumer<ArticleHolder>(
              builder: (context, news, child) {
                return ListView.builder(
                    itemCount: news.articles.length,
                    itemBuilder: (context, position) =>
                        NewsItem(news.articles[position]));
              },
            ),
          ),
        ),
      ),);
  }

  // TabController getTabController() {
  //   return TabController(length: 2, vsync: this);
  // }

  Tab getTab(String category) {
    return Tab(
      text: category,
    );
  }

  // Future<bool> _refresh(BuildContext context)

 
}
