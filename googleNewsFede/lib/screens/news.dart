import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:googleNewsFede/components/news_item.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:googleNewsFede/models/articlesHolder.dart';
import 'package:googleNewsFede/screens/preferred.dart';
import 'package:googleNewsFede/screens/search.dart';
import 'package:googleNewsFede/services/api.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int _selectedPage = 0;

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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.search),
              onPressed: () { goToSearchPage(); },
            );
          },
        ),
        title: Text(
          "NEWS APP",
          style: Theme.of(context).textTheme.headline1,
        ),
        bottom: bottomCreate(),
      ),
      body: bodyCreate(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            title: Text('Notizie'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            title: Text('Segui'),
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Colors.blue,
        onTap: _onPageSelected,
      ),
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
        context: context,
        category: newsTabs[_tabController.index].text.toLowerCase());
    setState(() {
      getTabView();
    });
  }

  void _onPageSelected(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
  Widget bottomCreate() {
    if(_selectedPage == 0) {
      return TabBar(
          tabs: newsTabs,
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.blue,
          indicatorWeight: 2,
          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        );
    } else {
      return PreferredSize(preferredSize: null,
      child: Container(),);
    }
  }
  Widget bodyCreate() {
    if(_selectedPage == 0) {
      return TabBarView(
        controller: _tabController,
        children: newsTabs.map((Tab tab) {
        return getTabView();
      }).toList());
    } else {
      this.readFromSharedPreference();
      return Preferred();
    }
  }
  Future<void> readFromSharedPreference() async {
    var articleHolder = Provider.of<ArticleHolder>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    var articleListString = new List<String>();
    articleListString = prefs.getStringList("articleList");
    if(articleListString != null && articleListString.length > 0) {
      final articleList = new List<Article>();
      articleListString.forEach((element) {
        Article art = Article.fromJson(json.decode(element));
        articleList.add(art);
      });
      articleHolder.savedArticles = articleList;
    }
  }

  goToSearchPage() {
    Navigator.push(context,
          MaterialPageRoute(builder: (context) => Search()));
  }
}
