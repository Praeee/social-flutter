import 'package:flutter/material.dart';
import 'package:social/utils/variables.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Search",style: mystyle(20),),
    );
  }
}