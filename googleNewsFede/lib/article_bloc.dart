import 'dart:async';

import 'package:googleNewsFede/services/api.dart';
import 'package:hive/hive.dart';

import 'main.dart';
import 'models/article.dart';
import 'services/db_repo.dart';

enum MyScreenView {news, favorites}


class ArticleBloc {
  Box<Article> favoriteBox;
  final Api _requestRepository = new Api();
  final DbRepository _dbRepository = DbRepository();

  String _actualCategory = "general";
  MyScreenView _actualScreen = MyScreenView.news;
  Article _actualArticle;

  final StreamController<String> _screenController = StreamController<String>.broadcast();
  final StreamController<List<Article>> _articles = StreamController<List<Article>>.broadcast();
  final StreamController<MyScreenView> _actualScreenController = new StreamController<MyScreenView>.broadcast();
  
  Stream<List<Article>> get articles => _articles.stream;
  Stream<String> get actualCategory => _screenController.stream;
  Stream<MyScreenView> get actualScreen => _actualScreenController.stream;
  
  ArticleBloc() {
    Hive.box<Article>(NewsBox).watch().forEach((element) {
      print(element.toString());
      _changeArticle();
    });
    favoriteBox = Hive.box(NewsBox);
  }

  changeCategory(String category) {
    _actualCategory = category;
    _articles.sink.add(null); //Clear news
    _screenController.sink.add(_actualCategory);
    getArticles();
  }

  _changeArticle(){
    //Se sono nella pagina dei favoriti prendo da db altrimenti da chiamate API
    if (MyScreenView.favorites == _actualScreen) _articles.sink.add(_dbRepository.getArticles());
    else getArticles();
  }

  changeScreen(int index) {
    _actualScreen = MyScreenView.values[index];
    _actualScreenController.sink.add(_actualScreen);
    //Quando cambio pagina cambio i contenuti
    _changeArticle();
  }

  getArticles() async {
    List<Article> response =
    await _requestRepository.fetchArticle(category: _actualCategory);
    _articles.sink.add(response);
  }

  setSelectedArticle(Article article) {
    _actualArticle = article;
  }

  getActualArticle() {
    return _actualArticle;
  }

  salvaPreferiti(Article article) {
    if(favoriteBox.containsKey(article.id)) {
      favoriteBox.delete(article.id);
    } else {
      favoriteBox.put(article.id,article);
    }
  }

  dispose() {
    _screenController?.close();
    _articles?.close();
    _actualScreenController?.close();
  }
}