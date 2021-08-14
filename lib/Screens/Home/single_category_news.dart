import 'package:flutter/material.dart';
import 'package:samachar/Services/news_service.dart';
import 'package:samachar/Shared/loading.dart';
import 'package:samachar/Shared/news_cards.dart';

class SingleCategory extends StatefulWidget {

  String urlNews;

  SingleCategory({required this.urlNews});

  @override
  _SingleCategoryState createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    NewsService service = NewsService(urlNews: widget.urlNews);
    // int? newsLength = service.newsLength;
    // print('$newsLength is newsLength');
    //service.getNews();

    return FutureBuilder(
      future: service.getNews(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: service.newsLength,
            itemBuilder: (context, index) {
              return NewsCard(imageLink: service.News[index].imageLink,newsTitle: service.News[index].title, description: service.News[index].description);
            },
          );
        }
        else{
          return Loading();
        }
      }
    );
    
    
    
  }
}
