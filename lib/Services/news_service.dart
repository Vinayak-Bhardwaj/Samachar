import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:samachar/Models/customized_news.dart';

class NewsService {
  String? title;
  String? description;
  String? content;
  String? image;
  int? newsLength;
  String urlNews;

  NewsService({required this.urlNews});

  var News = <CustomizedNews>[];

  //'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=acc6c7e1be91477bba7be4d79748a695';

  //String url = urlNews;
  
  //'https://newsapi.org/v2/top-headlines?country=in&from=2021-07-10&apiKey=acc6c7e1be91477bba7be4d79748a695';
      
      
      //'https://newsapi.org/v2/everything?q=Apple&from=2021-07-23&sortBy=popularity&apiKey=acc6c7e1be91477bba7be4d79748a695';

  Future<void> getNews() async {
    try {
      Response response = await get(Uri.parse(urlNews));
      Map data = jsonDecode(response.body);

      List articles = data['articles'];
      //print("Printing the articles");
      //print(articles.runtimeType);

      // title = articles[0]['title'];
      // description = articles[0]['description'];
      // content = articles[0]['content'];
      // image = articles[0]['urlToImage'];

      // print("Printing the titles");
      // print(title);
      // print("Printing the description");
      // print(description);
      // print("Printing the content");
      // print(content);

      for (int i = 0; i < articles.length; i++) {
        News.add(CustomizedNews(
            imageLink: articles[i]['urlToImage'], content: articles[i]['content'], description: articles[i]['description'], title: articles[i]['title']));
      }

      newsLength = articles.length;
      //print(newsLength);

    } catch (e) {
      print("*********************");
      print(e.toString());
    }
  }
}


