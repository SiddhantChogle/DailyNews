import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  final articleUrl;
  ArticlePage({this.articleUrl});

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  void initState() {
    super.initState();
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Daily",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.yellowAccent[700],
                  fontWeight: FontWeight.bold)),
          Text("News",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold)),
        ]),
        actions: [SizedBox(width: 56)],
        elevation: 2,
      ),
      body: WebView(
        initialUrl: widget.articleUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
