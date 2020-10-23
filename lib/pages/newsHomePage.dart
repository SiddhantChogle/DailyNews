import 'package:flutter/material.dart';
import 'package:daily_news/pages/pages.dart';
import 'package:daily_news/models/models.dart';
import 'package:daily_news/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsHomePage extends StatefulWidget {
  @override
  _NewsHomePageState createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  String url =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=3e5ace0d02df41e7b5978ccb720a34aa";
  var newsData;
  @override
  void initState() {
    fetchNews();
    super.initState();
  }

  fetchNews() async {
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
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8),
            Container(
              // padding: EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.center,
              height: 120,
              child: ListView.builder(
                itemCount: categoryList.length,
                itemBuilder: (context, index) => CategoryTile(
                    categoryName: categoryList[index].categoryName,
                    categoryImage: categoryList[index].categoryImage),
                scrollDirection: Axis.horizontal,
              ),
            ),
            Divider(height: 0, thickness: 2),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: newsData == null
                  ? Container(
                      alignment: AlignmentDirectional.center,
                      height: MediaQuery.of(context).size.height - 230,
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: newsData["articles"].length,
                      itemBuilder: (context, index) => NewsTile(
                        title: newsData["articles"][index]["title"],
                        description: newsData["articles"][index]["description"],
                        urlToImage: newsData["articles"][index]["urlToImage"],
                      ),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String categoryName, categoryImage;

  CategoryTile({this.categoryName, this.categoryImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CategoryNewsPage(categoryName: categoryName),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              height: 95,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: AssetImage(this.categoryImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 95,
              width: 150,
              child: Text(
                this.categoryName,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
