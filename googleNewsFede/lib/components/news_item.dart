import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:googleNewsFede/models/article.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:googleNewsFede/screens/newsDetailsWebView.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../article_bloc.dart';

class NewsItem extends StatefulWidget {
  final Article article;
  NewsItem(this.article, {Key key}) : super(key: key);

  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  
  @override
  void initState() {
    super.initState();
  }

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
            child: kIsWeb
                ? Image.network(
                    widget.article.urlToImage,
                    fit: BoxFit.fitWidth,
                  )
                : CachedNetworkImage(
                    imageUrl: widget.article.urlToImage,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) =>
                        center(CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        center(Icon(Icons.image)),
                  ),
            margin: EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 10),
            elevation: 3,
            color: Colors.white,
          ),
          Container(
            width: double.infinity,
            child: Text(
              widget.article.author != null ? widget.article.author : "Unknown source",
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.left,
            ),
            margin: EdgeInsets.only(left: 10, right: 10),
          ),
          Container(
            child: Text(widget.article.title != null ? widget.article.title : "",
                style: Theme.of(context).textTheme.headline2),
            margin: EdgeInsets.only(left: 10, right: 10),
          ),
          Container(
            width: double.infinity,
            child: Text(
              widget.article.publishedAt != null ? widget.article.publishedAt : "",
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
    final bloc = Provider.of<ArticleBloc>(context, listen: false);
    var url = widget.article.url != null ? widget.article.url : "";
    if (kIsWeb) {
      if (url != "") {
        if (await canLaunch(url) != null) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      if (url != "") {
        await bloc.setSelectedArticle(widget.article);
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => NewsDetailWebView()));
      }
    }
  }

  center(Widget widget) => Container(
      height: 200, color: Colors.grey[200], child: Center(child: widget));
}
