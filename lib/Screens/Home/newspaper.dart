import 'package:flutter/material.dart';

class NewsPaper extends StatefulWidget {

  @override
  _NewsPaperState createState() => _NewsPaperState();
}

class _NewsPaperState extends State<NewsPaper> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text("Im inside Newspaper");
  }
}