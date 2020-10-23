import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
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
    );
  }
}
