import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:googleNewsFede/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:googleNewsFede/bimby/bimby-bloc.dart';
import 'package:googleNewsFede/screens/google.dart';
import 'package:googleNewsFede/screens/news.dart';
import 'package:googleNewsFede/screens/search.dart';

import 'package:provider/provider.dart';

import 'bimby/home.dart';
import 'bimby/listaClienti.dart';
import 'common/theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/article.dart';

const String NewsBox = "NewsBox";
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleAdapter());
  await Hive.openBox<Article>(NewsBox);
  GoogleMap.init("AIzaSyA6GtAzv28pShkWC-T1SmnQF8yKtzY4z-Q");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BimbyBloc>(create: (_) => BimbyBloc()),
      ],
      child: MaterialApp(
            title: 'My News App',
            theme: appTheme,
            initialRoute: '/',
            routes: {
              '/': (context) => BimbyHome(title: "HOME"),
              '/clienti': (context) => ListaClienti(title: "CLIENTI"),
            //  '/': (context) => News(),
            //  '/search': (context) => Search(),
              // '/cart': (context) => MyCart(),
            },
          ),
    );
  }
}
