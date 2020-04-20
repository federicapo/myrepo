import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:googleNewsFede/screens/newsDetailsWebView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  final Article article;
  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openNews(context);
      },
      child: Container(
        child: Column(children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: article.urlToImage != null
                ? Image.network(
                    article.urlToImage,
                  )
                : Image(
                    image: AssetImage('default-image.jpg'),
                  ),
            margin: EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 10),
            elevation: 3,
            color: Colors.white,
          ),
          Container(
            width: double.infinity,
            child: Text(
              article.author != null ? article.author : "Unknown source",
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.left,
            ),
            margin: EdgeInsets.only(left: 10, right: 10),
          ),
          Container(
            child: Text(article.description != null ? article.description : "",
                style: Theme.of(context).textTheme.headline2),
            margin: EdgeInsets.only(left: 10, right: 10),
          ),
          Container(
            width: double.infinity,
            child: Text(
              article.publishedAt != null ? article.publishedAt : "",
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.left,
            ),
            margin: EdgeInsets.only(left: 10, right: 10),
          ),
        ]),
      ),
    );
  }
  openNews(BuildContext context) async {
    var url = article.url != null? article.url : "";
    if(kIsWeb) {
      if(url != "") {
        if (await canLaunch(url) != null) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      if(url != "") {
        var color = await colorDecide();
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => NewsDetailWebView(article, color)));
      }
      
    }
  }

  colorDecide() async {
    
    if(article.preferred) {
      return Colors.green[300];
    } else {
      var preferito = await cercaInShared();
      if(preferito) {
        return Colors.green[300];
      } else {
        return Colors.grey;
      }
    }
    
  }

  Future<bool> cercaInShared() async {
    final prefs = await SharedPreferences.getInstance();
    var articleListString = new List<String>();
    articleListString = prefs.getStringList("articleList");
    var isInList = false;
    if(articleListString != null) {
      String articleToFind = json.encode(article).replaceAll('"preferred":false', '"preferred":true');
      isInList = articleListString.contains(articleToFind);
    }
    return isInList;
  }
}
