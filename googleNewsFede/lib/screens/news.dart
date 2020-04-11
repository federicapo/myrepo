import 'package:flutter/material.dart';
import 'package:googleNewsFede/components/news_item.dart';
import 'package:googleNewsFede/models/articlesHolder.dart';
import 'package:googleNewsFede/services/api.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  final List<Tab> newsTabs = <Tab>[
    new Tab(text: 'general'),
    new Tab(text: 'technology'),
    new Tab(text: 'business'),
    new Tab(text: 'entertainment'),
    new Tab(text: 'health'),
    new Tab(text: 'sports'),
    new Tab(text: 'science'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: newsTabs.length);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEWS APP"),
        bottom: TabBar(
          tabs: newsTabs,
          isScrollable: true,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: newsTabs.map((Tab tab) {
            return getTabView();
          }).toList()),
    );
  }

  Widget getTabView() {
    return Container(
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
    );
  }

  Future<void> _handleTabSelection() async {
    await Api().fetchArticle(
          context: context, category: newsTabs[_tabController.index].text);
    setState(() {
      getTabView();
    });
  }
}
