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
        radius: 30.0,
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



// import 'package:flutter/material.dart';
// import 'package:world_time/services/world_time.dart';

// class ChooseLocation extends StatefulWidget {
//   @override
//   _ChooseLocationState createState() => _ChooseLocationState();
// }

// class _ChooseLocationState extends State<ChooseLocation> {

//   List<WorldTime> locations = [
//     WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
//     WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
//     WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
//     WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
//     WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
//     WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
//     WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
//     WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
//   ];

//   void updateTime(index) async {
//     WorldTime instance = locations[index];
//     await instance.getTime();
//     Navigator.pop(context, {
//       'location': instance.location,
//       'time': instance.time,
//       'flag': instance.flag,
//       'isDaytime': instance.isDaytime,
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         backgroundColor: Colors.blue[900],
//         title: Text('Choose a Location'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: ListView.builder(
//           itemCount: locations.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
//               child: Card(
//                 child: ListTile(
//                   onTap: () {
//                     updateTime(index);
//                   },
//                   title: Text(locations[index].location),
//                   leading: CircleAvatar(
//                     backgroundImage: AssetImage('assets/${locations[index].flag}'),
//                   ),
//                 ),
//               ),
//             );
//           }
//       ),
//     );
//   }
// }