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
    new Tab(text: 'General'),
    new Tab(text: 'Technology'),
    new Tab(text: 'Business'),
    new Tab(text: 'Entertainment'),
    new Tab(text: 'Health'),
    new Tab(text: 'Sports'),
    new Tab(text: 'Science'),
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
        backgroundColor: Colors.white,
        title: Text("NEWS APP", style: Theme.of(context).textTheme.headline1,),
        bottom: TabBar(
          tabs: newsTabs,
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.blue,
          indicatorWeight: 2,
          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
          context: context, category: newsTabs[_tabController.index].text.toLowerCase());
    setState(() {
      getTabView();
    });
  }
}
