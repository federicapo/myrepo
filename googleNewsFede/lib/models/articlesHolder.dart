import 'package:flutter/material.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:googleNewsFede/services/api.dart';


class ArticleHolder extends ChangeNotifier {
  final List<Article> _articles = [];
  final List<Article> _savedArticles = [];
  
  ArticleHolder() {
    Api().getInitialArticle().then((value) => articles = value);
  }
  
  set articles(List<Article> news) {
    _articles.clear();
    _articles.addAll(news);

    notifyListeners();
  }

  set savedArticles(List<Article> news) {
    _savedArticles.clear();
    _savedArticles.addAll(news);

    notifyListeners();
  }

  List<Article> get articles => _articles;

  List<Article> get savedArticles => _savedArticles;

}
