import 'package:flutter/material.dart';
import 'package:samachar/Shared/category_card.dart';

class MultipleCategory extends StatefulWidget {

  @override
  _MultipleCategoryState createState() => _MultipleCategoryState();
}

class _MultipleCategoryState extends State<MultipleCategory> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return CategoryCard();
  }
}