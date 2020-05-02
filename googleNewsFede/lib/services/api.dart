import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

const String API = "http://newsapi.org/v2/";
const String TOP = "top-headlines";
const String TOKEN = "5920fbb42d194ec9be1500b5094ed123";

class Api {
  final Dio dio = Dio();
  final DioCacheManager dioCache = DioCacheManager(CacheConfig(baseUrl: API));

  Api() {
    dio.options.baseUrl = API;
    dio.options.connectTimeout = 5000;
    dio.transformer = FlutterTransformer();
    if (!kIsWeb) dio.interceptors.add(dioCache.interceptor);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // Do something before request is sent
      if (options.extra.isNotEmpty) {
        options.queryParameters.addAll(options.extra);
      }
      LinkedHashMap<String, dynamic> params = options.queryParameters;
      params['apiKey'] = TOKEN;
      params['country'] = 'it';
      options.queryParameters = params;
      return options;
    }, onResponse: (Response response) async {
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) async {
      // Do something with response error
      return e; //continue
    }));
  }

  Future<List<Article>> fetchArticle({String category, String query}) async {
    Response response = await dio.get(TOP,
        options: buildCacheOptions(Duration(seconds: 120),
            options: Options(extra: createExtras(category: category, query: query))));
    return response.data['articles']
        .map<Article>((json) => Article.fromJson(json))
        .toList();
  }

  Map<String, dynamic> createExtras({String category, String query}) {
    LinkedHashMap<String, dynamic> map = LinkedHashMap();
    if(category != null)
      map['category'] = category;
    if(query != null)
      map['q'] = query;
    return map;
  }
}
