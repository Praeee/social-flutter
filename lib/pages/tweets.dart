import 'package:flutter/material.dart';
import 'package:social/addtweet.dart';
import 'package:social/utils/variables.dart';

class TweetsPage extends StatefulWidget {
  @override
  _TweetsPageState createState() => _TweetsPageState();
}

class _TweetsPageState extends State<TweetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTweet())),
          child: Icon(Icons.add, size: 32),
        ),
        appBar: AppBar(
          actions: [
            Icon(Icons.star, size: 32),
          ],
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flitter',
                style: mystyle(20, Colors.white, FontWeight.w700),
              ),
              SizedBox(
                width: 5.0,
              ),
              Image(
                  width: 30,
                  height: 30,
                  image: AssetImage('images/twitter.png'))
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(exampleimage),
                  ),
                  title: Text(
                    "Username",
                    style: mystyle(20, Colors.black, FontWeight.w600),
                  ),
                  subtitle: Column(
                    children: [
                      Text(
                        "Flutter is cool! It rocks",
                        style: mystyle(20, Colors.black, FontWeight.w400),
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.comment),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '4',
                                  style: mystyle(18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.favorite_border),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '10',
                                  style: mystyle(18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.share),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '5',
                                  style: mystyle(18),
                                ),
                              ],
                            ),
                          ])
                    ],
                  ),
                ),
              );
            }));
  }
}
