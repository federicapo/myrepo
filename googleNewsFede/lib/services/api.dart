import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:googleNewsFede/models/articlesHolder.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

const String API = "http://newsapi.org/v2/";
const String TOP = "top-headlines";
const String TOKEN = "5920fbb42d194ec9be1500b5094ed123";


class Api {


  Future<List<Article>> getInitialArticle() async {
    var client = new http.Client();
    final response =
      await client.get(_buildUrl(TOP));
      return await compute(_parseArticle, response.body);

  }

  Future<void> fetchArticle({@required BuildContext context, String category}) async {
    var articleHolder = Provider.of<ArticleHolder>(context, listen: false);
    var client = new http.Client();
    final response =
      await client.get(_buildUrl(TOP, category: category));
    List<Article> news = await compute(_parseArticle, response.body);
    articleHolder.articles = news;

  }

  static List<Article> _parseArticle(String responseBody) {
  final parsed = json.decode(responseBody);

  return parsed["articles"].map<Article>((json) => 
    Article.fromJson(json)).toList();
  }




  _buildUrl(String endpoint, {String category}) {
    var url = 'http://newsapi.org/v2/$endpoint?country=it&apiKey=$TOKEN';
    if(category != null) url += '&category=$category';
    return url;
  }
}

