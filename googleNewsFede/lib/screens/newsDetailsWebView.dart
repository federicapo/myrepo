import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class NewsDetailWebView extends StatefulWidget {
  final url;
  NewsDetailWebView(this.url);
  @override
  createState() => _NewsDetailWebViewState(this.url);
}
class _NewsDetailWebViewState extends State<NewsDetailWebView> {
  var _url;
  final _key = UniqueKey();
  _NewsDetailWebViewState(this._url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _url))
          ],
        ));
  }
}