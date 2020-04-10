import 'package:flutter/material.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:googleNewsFede/services/api.dart';


class ArticleHolder extends ChangeNotifier {
  final List<Article> _articles = [];
  final Map<String, List<Article>> _articleMap = Map();

  ArticleHolder() {
    Api().getInitialArticle().then((value) => articles = value);
  }
  
  set articles(List<Article> news) {
    _articles.clear();
    _articles.addAll(news);

    notifyListeners();
  }

  addToArticleMap(String key, List<Article> articles) {
    // _articleMap[key] = articles
  }

  List<Article> get articles => _articles;

}
