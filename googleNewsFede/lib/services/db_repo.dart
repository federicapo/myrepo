import '../main.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:hive/hive.dart';

class DbRepository {
  Box<Article> favoritesNews = Hive.box(NewsBox);

  addArticle(Article article) => favoritesNews.put(article.id, article);

  List<Article> getArticles() => favoritesNews.values.toList();

  watch() => favoritesNews.watch();
}
