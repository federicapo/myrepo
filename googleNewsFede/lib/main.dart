import 'package:googleNewsFede/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:googleNewsFede/screens/news.dart';
import 'package:googleNewsFede/screens/search.dart';

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
    return MultiProvider(
      providers: [
        Provider<ArticleBloc>(create: (_) => ArticleBloc()),
      ],
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
