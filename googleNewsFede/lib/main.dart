import 'package:googleNewsFede/models/articlesHolder.dart';
import 'package:flutter/material.dart';
import 'package:googleNewsFede/screens/news.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return ChangeNotifierProvider (
          create: (context) => ArticleHolder(),
          // update: (BuildContext context, value, ArticleHolder previous) {  },
          child: MaterialApp(
            title: 'My News App',
            theme: appTheme,
            initialRoute: '/',
            routes: {
              '/': (context) => News(),
              // '/catalog': (context) => MyCatalog(),
              // '/cart': (context) => MyCart(),
            },
          ),
    );
  }
}
