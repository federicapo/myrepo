import 'package:flutter/material.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:googleNewsFede/services/api.dart';


class ArticleHolder extends ChangeNotifier {
  final List<Article> _articles = [];
  
  ArticleHolder() {
    Api().getInitialArticle().then((value) => articles = value);
  }
  
  set articles(List<Article> news) {
    _articles.clear();
    _articles.addAll(news);

    notifyListeners();
  }

  List<Article> get articles => _articles;

}
