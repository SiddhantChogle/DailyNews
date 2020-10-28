import 'package:flutter/material.dart';
import 'package:daily_news/pages/pages.dart';

class NewsTile extends StatelessWidget {
  final String title, description, urlToImage, url;

  NewsTile({this.title, this.description, this.urlToImage, this.url});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticlePage(
                        articleUrl: url,
                      )),
            );
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: urlToImage == ""
                    ? Container(
                        // padding: EdgeInsets.symmetric(vertical: 80),
                        height: 160,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        height: size.height * 0.24,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(urlToImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: Text(
                  this.title,
                  style: TextStyle(
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: false,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.description,
                    style: TextStyle(
                        fontSize: size.width * 0.04, color: Colors.grey[600]),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    softWrap: false,
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
