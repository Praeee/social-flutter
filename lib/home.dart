import 'package:flutter/material.dart';
import 'package:social/utils/variables.dart';
import 'package:social/pages/profile.dart';
import 'package:social/pages/search.dart';
import 'package:social/pages/tweets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List pageoptions = [TweetsPage(), SearchPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageoptions[page],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.black,
          currentIndex: page,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                title: Text(
                  "Tweets",
                  style: mystyle(20),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                title: Text(
                  "Search",
                  style: mystyle(20),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                title: Text(
                  "Profile",
                  style: mystyle(20),
                ))
          ]),
    );
  }
}
