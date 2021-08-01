import 'package:flutter/material.dart';

class Mews extends StatefulWidget {

  @override
  _MewsState createState() => _MewsState();
}

class _MewsState extends State<Mews> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text("Im inside Mews");
  }
}