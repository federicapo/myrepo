import 'package:flutter/material.dart';

@immutable
class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String source;
  final bool preferred;

  Article({this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.source, this.preferred});

  factory Article.fromJson(Map<String,dynamic> json) {
    return Article(
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      source: json['source']['name'] as String,
      preferred: json['preferred'] != null? json['preferred'] as bool : false  
    );
  }

  Map<String, dynamic> toJson() =>
    {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'source' : {'name': source},
      'preferred' : preferred
    };
}