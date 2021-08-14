import 'package:flutter/material.dart';
import 'package:samachar/Models/customized_category.dart';

class CategoryCard extends StatefulWidget {

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {


  List<CustomizedCategory> list_of_category = [
    CustomizedCategory(title: "Buisness News", imageLink: 'business4.jpeg', category_endpoint: "business"),
    CustomizedCategory(title: "Enterntainment News", imageLink: 'entertainment.jpeg', category_endpoint: "entertainment"),
    CustomizedCategory(title: "Health News", imageLink: 'health2.png', category_endpoint: "health"),
    CustomizedCategory(title: "Science News", imageLink: 'science4.png', category_endpoint: "science"),
    CustomizedCategory(title: "Sports News", imageLink: 'sports4.jpeg', category_endpoint: "sports"),
    CustomizedCategory(title: "Technology News", imageLink: 'techq.png', category_endpoint: "technology"),
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: list_of_category.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            contentPadding: EdgeInsets.all(8),
            tileColor: Colors.amber[200],
            shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/${list_of_category[index].imageLink}'),
        radius: size.height*0.0365,
        backgroundColor: Color(0xFFF1E6FF),
      ),
      title: Text(list_of_category[index].title, style: TextStyle(letterSpacing: 1.0, fontWeight: FontWeight.bold)),
      onTap: () {
        Navigator.pushNamed(context, '/CategoryWiseNews', arguments: {
          'title' : list_of_category[index].title,
          'category_endpoint' : list_of_category[index].category_endpoint,
        });
      }
          ),
        );
      },
    );
  }
}



