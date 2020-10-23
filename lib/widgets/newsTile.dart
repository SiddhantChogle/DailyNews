import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String title, description, urlToImage;

  NewsTile({this.title, this.description, this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Container(
                height: 160,
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
    );
  }
}
