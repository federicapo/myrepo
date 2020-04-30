import 'package:googleNewsFede/models/articlesHolder.dart';
import 'package:flutter/material.dart';
import 'package:googleNewsFede/screens/news.dart';
import 'package:googleNewsFede/screens/search.dart';
import 'package:googleNewsFede/services/db_repo.dart';

import 'package:provider/provider.dart';

import 'common/theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/article.dart';

const String NewsBox = "NewsBox";
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleAdapter());
  await Hive.openBox<Article>(NewsBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider (
          create: (context) => ArticleHolder(),
          // update: (BuildContext context, value, ArticleHolder previous) {  },
          child: MaterialApp(
            title: 'My News App',
            theme: appTheme,
            initialRoute: '/',
            routes: {
              '/': (context) => News(),
             '/search': (context) => Search(),
              // '/cart': (context) => MyCart(),
            },
          ),
    );
  }
}
