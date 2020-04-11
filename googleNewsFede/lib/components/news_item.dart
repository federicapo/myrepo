import 'package:flutter/material.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:googleNewsFede/screens/newsDetailsWebView.dart';
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
      if(url != "")
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewsDetailWebView(url)));
    }
  }
}
