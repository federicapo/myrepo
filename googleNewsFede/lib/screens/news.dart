import 'package:flutter/material.dart';
import 'package:googleNewsFede/article_bloc.dart';
import 'package:googleNewsFede/components/news_item.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:googleNewsFede/screens/search.dart';
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
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: newsTabs.length);
    _tabController.addListener(_handleTabSelection);
    final bloc = Provider.of<ArticleBloc>(context, listen: false);
    bloc.getArticles();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ArticleBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                goToSearchPage();
              },
            );
          },
        ),
        title: Text(
          "NEWS APP",
          style: Theme.of(context).textTheme.headline1,
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(34.0),
            child: StreamBuilder<MyScreenView>(
              stream: bloc.actualScreen,
              builder: (context, AsyncSnapshot<MyScreenView> snapshot) {
                return bottomBarCreate(snapshot.data);
              },
            )),
      ),
      body: bodyCreate(bloc),
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
        onTap: (index) => _onPageSelected(index,bloc)
      ),
    );
  }

  void _onPageSelected(int index,bloc) {
    setState(() {
      _selectedPage = index;
    });
    bloc.changeScreen(index);
  }

  Widget bodyCreate(bloc) {
    return Center(
        child: StreamBuilder<List<Article>>(
            stream: bloc.articles,
            builder: (context, AsyncSnapshot<List<Article>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, position) =>
                        NewsItem(snapshot.data[position]));
              } else
                return CircularProgressIndicator();
            }));
  }

  Future<void> _handleTabSelection() async {
    if (!_tabController.indexIsChanging) {
      final bloc = Provider.of<ArticleBloc>(context, listen: false);
      bloc.changeCategory(newsTabs[_tabController.index].text.toLowerCase());
    } else
      print("Tab is switching..from active to inactive");
  }

  Widget bottomBarCreate(MyScreenView screen) {
    if (screen == MyScreenView.favorites) {
      return Container();
    } else {
      return TabBar(
        tabs: newsTabs,
        isScrollable: true,
        controller: _tabController,
        indicatorColor: Colors.blue,
        indicatorWeight: 2,
        labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      );
    }
  }

  goToSearchPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
  }
}
