import 'package:flutter/material.dart';
import 'package:daily_news/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryNewsPage extends StatefulWidget {
  final categoryName;
  CategoryNewsPage({Key key, this.categoryName}) : super(key: key);

  @override
  _CategoryNewsPageState createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  String url;

  var newsData;
  var categoryNewsName;

  // static get categoryName => null;

  @override
  void initState() {
    fetchNews(widget.categoryName);
    super.initState();
  }

  fetchNews(String categoryName) async {
    categoryNewsName = categoryName.toLowerCase();
    url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$categoryNewsName&apiKey=3e5ace0d02df41e7b5978ccb720a34aa";
    var response = await http.get(url);
    var newsJsonData = jsonDecode(response.body);
    newsData = newsJsonData;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Container(
        child: newsData == null
            ? Container(
                alignment: AlignmentDirectional.center,
                height: MediaQuery.of(context).size.height - 60,
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: newsData["articles"].length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => print("News Article"),
                  child: NewsTile(
                    title: newsData["articles"][index]["title"],
                    description: newsData["articles"][index]["description"],
                    urlToImage: newsData["articles"][index]["urlToImage"],
                  ),
                ),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
              ),
      ),
    );
  }
}
