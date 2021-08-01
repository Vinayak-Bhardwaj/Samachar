import 'package:flutter/material.dart';
import 'package:samachar/Services/news_service.dart';
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
          return CircularProgressIndicator();
        }
      }
    );
    
    
    
  }
}


//  _showImageDialog() {
//     MediaQueryData queryData;
//     queryData = MediaQuery.of(context);

//     double width = queryData.size.width;
//     double height = queryData.size.height;

//     return showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: ((context) {
//         return SimpleDialog(
//           //MAKING ROUNDED EDGES OF THE POP UP BOX
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(40),
//             side: BorderSide(
//               color: Colors.white,
//               width: width / 205.71,
//               style: BorderStyle.solid,
//             ),
//           ),

//           backgroundColor: Color(0xFF070b12),

//           //TITLE OF THE POPUP
//           title: Text(
//             "Create Post!",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               fontSize: height / 23.44,
//             ),
//           ),
//           elevation: 4,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//             ),

//             //ADDING THE DARK IMAGE
//             SizedBox(
//                 width: width / 2.7428,
//                 height: height / 4.6889,
//                 child: new Image(
//                   image: new AssetImage("assets/Send.gif"),
//                   fit: BoxFit.fitWidth,
//                 )),

//             Padding(
//               padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//             ),

//             Padding(
//               padding: EdgeInsets.fromLTRB(width / 13.714, 0, width / 13.714, height / 82.057),

//               //ADDING THE CHOOSE FROM GALLERY BUTTON
//               child: FlatButton(
//                 splashColor: Colors.white,
//                 color: Colors.white,
//                 onPressed: () {
//                   _pickImage('Gallery').then(
//                     (selectedImage) {
//                       //setState(() => imageFile = selectedImage);
//                       if (selectedImage.lengthSync() / 1000 > 5000) {
//                         showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                                   title: Text("Image size can't be greater than 5 MB"),
//                                   actions: <Widget>[
//                                     RaisedButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       child: Text("OK"),
//                                     ),
//                                   ],
//                                 ));
//                       } else {
//                         setState(() {
//                           imageFile = selectedImage;
//                         });
// //                      _cropImage(selectedImage).then((value) {
// //                        setState(() {
// //                          imageFile = value;
// //                        });
// //                      });
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: ((context) => InstaUploadPhotoScreen(imageFile: imageFile)),
//                           ),
//                         );
//                       }
//                     },
//                   );
//                 },
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(0, height / 82.057, 0, height / 82.057),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 0),
//                         child: Text(
//                           'Choose from Gallery',
//                           style: TextStyle(
//                             fontSize: height / 41.0285,
//                             color: Colors.black,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             Padding(
//               padding: EdgeInsets.fromLTRB(
//                   width / 13.714, height / 82.057, width / 13.714, height / 82.057),

//               //Adding take photo button
//               child: FlatButton(
//                 splashColor: Colors.white,
//                 color: Colors.white,
//                 onPressed: () {
//                   _pickImage('Camera').then(
//                     (selectedImage) {
//                       //setState(() => imageFile = selectedImage);
//                       if (selectedImage.lengthSync() / 1000 > 5000) {
//                         showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                                   title: Text("Image size can't be greater than 5 MB"),
//                                   actions: <Widget>[
//                                     RaisedButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       child: Text("OK"),
//                                     ),
//                                   ],
//                                 ));
//                       } else {
//                         setState(() {
//                           imageFile = selectedImage;
//                         });
// //                      _cropImage(selectedImage).then((value) {
// //                        setState(() {
// //                          imageFile = value;
// //                        });
// //                      });
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: ((context) => InstaUploadPhotoScreen(imageFile: imageFile)),
//                           ),
//                         );
//                       }
//                     },
//                   );
//                 },