import 'package:flutter/material.dart';
import 'package:samachar/Shared/divider.dart';

class NewsCard extends StatefulWidget {
  String? imageLink;
  String? newsTitle;
  String? description;
  NewsCard({required this.imageLink, required this.newsTitle, this.description});

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {

  readNews() {
    return showDialog(
      context: context,
      builder: ((context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(
              color: Colors.white,
              width: 7,
              style: BorderStyle.solid,
            ),
          ),
          backgroundColor: Color(0xFF070b12),
          elevation: 4,
          children: <Widget>[

            SizedBox(height: 13.0, width: 1000),

            Text("NEWS AT A GLANCE", style: TextStyle(color: Colors.white, letterSpacing: 1.0, fontWeight: FontWeight.bold,fontSize: 23.0), textAlign: TextAlign.center),

            Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Divider(
              color: Colors.white,
              thickness: 1.0,
            ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.network(
                  (widget.imageLink != null) ?
                  '${widget.imageLink?.replaceAll('////', '//')}' :
                  'https://image.shutterstock.com/image-vector/reading-news-on-digital-tablet-260nw-1687528333.jpg',
                  
                ),
            ),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text( (widget.description != null) ? '${widget.description}' : '${widget.newsTitle}', style: TextStyle(color: Colors.white, fontSize:15.0, letterSpacing: 0.5)),
              ),

              SizedBox(height: 30.0, width: 1000),

          ],
        );
      }),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.red[600],
      shadowColor: Colors.grey,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: GestureDetector(
          onTap: readNews,
          child: Column(
            children: <Widget>[
              Image.network(
                (widget.imageLink != null) ?
                '${widget.imageLink?.replaceAll('////', '//')}' :
                'https://image.shutterstock.com/image-vector/reading-news-on-digital-tablet-260nw-1687528333.jpg',
                
              ),

              SizedBox(height: 15),

              Text('${widget.newsTitle}', style: TextStyle(color: Colors.white, fontSize:15.0, letterSpacing: 0.5)),
            ],
          ),
        ),
      ),
    );
  }
}
